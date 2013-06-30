require "rubygems"
require "kconv"
require "tmp_cache"

require "skype/version"
require "skype/filter"
require case RUBY_PLATFORM
        when /darwin/
          "skype/platforms/mac"
        when /linux/
          "skype/platforms/linux"
        else
          STDERR.puts %Q{!!Skype gem cannot support your platform "#{RUBY_PLATFORM}" not support.}
        end
require "skype/main"
require "skype/wrappers/chat"
require "skype/wrappers/call"

module Skype
end
