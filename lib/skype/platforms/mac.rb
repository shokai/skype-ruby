module Skype
  def self.exec(command, opts={:response_filter => true})
    script = %Q{tell application "Skype"
  send command "#{Utils.escape command}" script name "#{self.config[:app_name]}"
end tell}
    res = `unset LD_LIBRARY_PATH; unset DYLD_LIBRARY_PATH; /usr/bin/osascript -e '#{script}'`.strip
    res = filter_response res if opts[:response_filter]
    res
  end

  module Utils
    def self.escape(str)
      str.gsub(/(["\\])/){ "\\#{$1}" }.
        gsub("'"){ "'\\''" }
    end
  end
end
