require case RUBY_PLATFORM
        when /darwin/
          "skype/platforms/mac"
        when /linux/
          "skype/platforms/linux"
        else
          STDERR.puts %Q{!!Skype gem cannot support your platform "#{RUBY_PLATFORM}" not support.}
        end

module Skype
  @@config = {:app_name => "ruby-skype"}
  def self.config(conf=nil)
    if conf.kind_of? Hash
      conf.each do |k,v|
        @@config[k.to_sym] = v
      end
    else
      return @@config
    end
  end

  def self.method_missing(name, *args)
    self.exec "#{name.upcase} #{args.join(' ')}"
  end
end
