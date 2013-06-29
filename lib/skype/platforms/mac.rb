module Skype
  def self.exec(command)
    script = %Q{tell application "Skype"
  send command "#{Utils.escape command}" script name "#{self.config[:app_name]}"
end tell}
    filter_response `unset LD_LIBRARY_PATH; unset DYLD_LIBRARY_PATH; /usr/bin/osascript -e '#{script}'`.strip
  end

  module Utils
    def self.escape(str)
      str.gsub(/(["\\])/){ "\\#{$1}" }.
        gsub("'"){ "'\\''" }
    end
  end
end
