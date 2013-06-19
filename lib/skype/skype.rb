require case RUBY_PLATFORM
        when /darwin/
          "skype/platforms/mac"
        when /linux/
          "skype/platforms/linux"
        end

module Skype
  @@opts = {:app_name => "ruby-skype"}
  def self.opts
    @@opts
  end

  def self.method_missing(name, *args)
    self.exec "#{name.upcase} #{args.join(' ')}"
  end
end
