require "dbus"

module Skype
  class Connection

    def initialize
      set_dbus_session_bus_address
      @bus = DBus.session_bus
      @service = @bus.service('com.Skype.API').object('/com/Skype')
      @service.default_iface = 'com.Skype.API'
      @service.introspect
      invoke "NAME #{::Skype.config[:app_name]}"
      invoke "PROTOCOL 99"
    end

    def invoke(cmd)
      @service.Invoke(cmd)[0]
    end

    private
    def set_dbus_session_bus_address
      return if ENV['DBUS_SESSION_BUS_ADDRESS']
      addrs = []
      Dir.glob("#{ENV['HOME']}/.dbus/session-bus/*").each do |fname|
        File.open fname do |f|
          addrs.push f.readlines.find{|line|
            line =~ /^DBUS_SESSION_BUS_ADDRESS=/
          }.gsub(/^DBUS_SESSION_BUS_ADDRESS=/,'')
        end
      end
      ENV['DBUS_SESSION_BUS_ADDRESS'] = addrs[0]
    end
  end

  def self.exec(command, opts={:response_filter => true})
    res = (@@connection||=Connection.new).invoke command
    res = filter_response res if opts[:response_filter]
    res
  end
end
