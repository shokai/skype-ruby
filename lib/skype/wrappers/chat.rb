module Skype

  response_filter /^(CHAT)?MESSAGE (\d+) STATUS (SENT|SENDING)$/ do |res|
    Skype::Chat::Message.new res.scan(/^(CHAT)?MESSAGE (\d+) STATUS (SENT|SENDING)$/)[0][1].to_i
  end

  def self.chats
    search("recentchats").
      scan(/\s(#[^\s,]+),?/).
      map{|i| Chat.new i[0] }
  end

  class Chat
    attr_reader :id, :topic, :members

    def initialize(id)
      @id = id
      @topic = ::Skype.exec("GET CHAT #{@id} TOPIC").scan(/TOPIC (.*)$/)[0][0].toutf8 rescue @topic = ""
      @members = ::Skype.exec("GET CHAT #{@id} MEMBERS").scan(/MEMBERS (.+)$/)[0][0].split(/\s/) rescue @members = []
    end

    def messages
      ::Skype.exec("GET CHAT #{@id} RECENTCHATMESSAGES").
        split(/,? /).
        select{|i| i =~ /^\d+$/ }.
        map{|i| Skype::Chat::Message.new i }
    end

    def post(message)
      ::Skype.exec "CHATMESSAGE #{@id} #{message}"
    end

    class Message
      @@cache = TmpCache::Cache.new

      attr_reader :id, :user, :body, :time

      def initialize(id)
        @id = id.to_i
        if cache = @@cache.get(@id)
          @user = cache[:user]
          @body = cache[:body]
          @time = cache[:time]
        end
      end

      def user
        get_properties
        @user
      end

      def body
        get_properties
        @body
      end

      def time
        get_properties
        @time
      end

      def to_s
        "[#{time}] <#{user}> #{body} "
      end

      private
      def get_properties
        return if @user and @body and @time
        @user = ::Skype.exec("GET CHATMESSAGE #{@id} from_handle").split(/\s/).last rescue @user = ""
        @body = ::Skype.exec("GET CHATMESSAGE #{@id} body").scan(/^(CHAT)?MESSAGE #{@id} BODY (.+)$/)[0][1] rescue @body = ""
        @time = Time.at ::Skype.exec("GET CHATMESSAGE #{@id} timestamp").split(/\s/).last.to_i
        @@cache.set(@id, {
                      :user => @user,
                      :body => @body,
                      :time => @time
                    }, 3600*72)
      end

    end

  end

end
