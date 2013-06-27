module Skype

  def self.chats
    search("recentchats").
      scan(/(#[^\s,]+)[\s,]/).
      map{|i| Chat.new i[0] }
  end

  class Chat
    attr_reader :id, :members

    def initialize(id)
      @id = id
      @members = ::Skype::exec("GET CHAT #{@id} MEMBERS").scan(/MEMBERS (.+)$/)[0][0].split(/\s/)
    end

    def messages
      ::Skype.exec("GET CHAT #{@id} RECENTCHATMESSAGES").
        split(/,? /).
        select{|i| i =~ /^\d+$/ }.
        map{|i| Skype::Chat::Message.new i.to_i }
    end

    def post(message)
      ::Skype.exec "CHATMESSAGE #{@id} #{message}"
    end

    class Message

      def initialize(id)
        @id = id
        @user = ::Skype.exec("GET CHATMESSAGE #{@id} from_handle").split(/\s/).last
        @body = ::Skype.exec("GET CHATMESSAGE #{@id} body").scan(/^MESSAGE #{@id} BODY (.+)$/)[0][0]
        @time = Time.at ::Skype.exec("GET CHATMESSAGE #{@id} timestamp").split(/\s/).last.to_i
      end

      def to_s
        "[#{@time}] <#{@user}> #{@body} "
      end

    end

  end

end
