require case RUBY_PLATFORM
        when /darwin/
          "skype/platforms/mac"
        when /linux/
          "skype/platforms/linux"
        end

module Skype
  def self.method_missing(name, *args)
    self.exec "#{name.upcase} #{args.join(' ')}"
  end
end
