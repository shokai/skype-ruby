require "appscript"

module Skype
  def self.exec(command)
    Appscript.app("skype").send_ :script_name => self.opts[:app_name], :command => command
  end
end
