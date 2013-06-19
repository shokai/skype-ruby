require "appscript"

module Skype
  def self.exec(command)
    Appscript.app("skype").send_ :script_name => self.config[:app_name], :command => command
  end
end
