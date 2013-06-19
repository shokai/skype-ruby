require "appscript"

module Skype
  def self.exec(command)
    Appscript.app("skype").send_ :script_name => "", :command => command
  end
end
