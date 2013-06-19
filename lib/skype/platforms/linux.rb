require "dbus"

module Skype
  class Connection

    def initialize
      @bus = DBus.session_bus
      @service = @bus.service('com.Skype.API').object('/com/Skype')
      @service.default_iface = 'com.Skype.API'
      @service.introspect
      invoke "NAME #{::Skype.opts[:app_name]}"
      invoke "PROTOCOL 99"
    end

    def invoke(cmd)
      @service.Invoke(cmd)[0]
    end
  end

  def self.exec(command)
    (@@connection||=Connection.new).invoke command
  end
end
