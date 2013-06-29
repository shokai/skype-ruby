module Skype

  def self.chats
    search("recentchats").
      scan(/(#[^\s,]+)[\s,]/).
      map{|i| Chat.new i[0] }
  end

  class Chat
    @@message_cache = TmpCache::Cache.new

    attr_reader :id, :topic, :members

    def initialize(id)
      @id = id
      @topic = ::Skype::exec("GET CHAT #{@id} TOPIC").scan(/TOPIC (.*)$/)[0][0].toutf8
      @members = ::Skype::exec("GET CHAT #{@id} MEMBERS").scan(/MEMBERS (.+)$/)[0][0].split(/\s/)
    end

    def messages
      ::Skype.exec("GET CHAT #{@id} RECENTCHATMESSAGES").
        split(/,? /).
        select{|i| i =~ /^\d+$/ }.
        map{|i| i.to_i }.
        map{|i| @@message_cache.get(i) || @@message_cache.set(i, Skype::Chat::Message.new(i), 3600*72) }.
        sort{|a,b| b.time <=> a.time }
    end

    def post(message)
      ::Skype.exec "CHATMESSAGE #{@id} #{message}"
    end

    class Message

      attr_reader :id, :user, :body, :time

      def initialize(id)
        @id = id
        @user = ::Skype.exec("GET CHATMESSAGE #{@id} from_handle").split(/\s/).last rescue @user = ""
        @body = ::Skype.exec("GET CHATMESSAGE #{@id} body").scan(/^(CHAT)?MESSAGE #{@id} BODY (.+)$/)[0][1] rescue @body = ""
        @time = Time.at ::Skype.exec("GET CHATMESSAGE #{@id} timestamp").split(/\s/).last.to_i
      end

      def to_s
        "[#{@time}] <#{@user}> #{@body} "
      end

    end

  end

end
