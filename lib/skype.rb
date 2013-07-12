require "rubygems"
require "kconv"
require "tmp_cache"

require "skype/version"
require "skype/filter"
require case RUBY_PLATFORM
        when /darwin/i
          "skype/platforms/mac"
        when /linux/i
          "skype/platforms/linux"
        else
          STDERR.puts %Q{!!Skype gem cannot support your platform "#{RUBY_PLATFORM}"}
        end
require "skype/main"
require "skype/wrappers/chat"
require "skype/wrappers/call"
require "skype/wrappers/error"

module Skype
end
