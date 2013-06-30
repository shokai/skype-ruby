module Skype

  response_filter /^CALL \d+ STATUS [A-Z]+$/ do |res|
    Skype::Call.new res.scan(/CALL (\d+)/)[0][0]
  end

  class Call

    def initialize(id)
      @id = id.to_i
      @time = Time.at ::Skype.exec("GET CALL #{id} TIMESTAMP").split(/\s/).last.to_i
      @to = ::Skype.exec("GET CALL #{id} PARTNER_HANDLE").scan(/PARTNER_HANDLE (.+)$/)[0][0] rescue @to = ""
    end

    def status
      begin
        return ::Skype.exec("GET CALL #{@id} STATUS", :response_filter => false).scan(/([A-Z]+)$/)[0][0].downcase.to_sym
      rescue
        return :api_error
      end
    end

    def hangup
      ::Skype.exec "ALTER CALL #{@id} HANGUP"
    end
  end

end
