module Skype
  def self.exec(command)
    Appscript.app("skype").send_ :script_name => "", :command => command
  end

  def self.method_missing(name, *args)
    self.exec "#{name.upcase} #{args.join(' ')}"
  end
end
