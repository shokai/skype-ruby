require "rubygems"

require "skype/version"

require case RUBY_PLATFORM
        when /darwin/
          "skype/platforms/mac"
        when /linux/
          "skype/platforms/linux"
        else
          STDERR.puts %Q{!!Skype gem cannot support your platform "#{RUBY_PLATFORM}" not support.}
        end

require "skype/main"

module Skype
end
