module Skype
  def self.exec(command)
    script = %Q{tell application "Skype"
  send command "#{Utils.escape command}" script name "#{self.config[:app_name]}"
end tell}
    res = `/usr/bin/osascript -e '#{script}'`.split(/[\n\r]+/)
    res.shift if res.size > 1 and res[0] =~ /^dyld: /
    res[0]
  end

  module Utils
    def self.escape(str)
      str.gsub(/(["\\])/){ "\\#{$1}" }.
        gsub("'"){ "'\\''" }
    end
  end
end
