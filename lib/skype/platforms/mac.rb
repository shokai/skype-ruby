module Skype
  def self.exec(command)
    script = %Q{tell application "Skype"
  send command "#{Utils.escape command}" script name "#{self.config[:app_name]}"
end tell}
    res = `unset LD_LIBRARY_PATH; unset DYLD_LIBRARY_PATH; /usr/bin/osascript -e '#{script}'`.split(/[\n\r]+/)
    res.shift if res.size > 1 and res[0] =~ /^dyld: /
    res = res[0]
    @@filters.each do |filter, block|
      if res =~ filter
        res = block.call(res)
        break
      end
    end
    res
  end

  module Utils
    def self.escape(str)
      str.gsub(/(["\\])/){ "\\#{$1}" }.
        gsub("'"){ "'\\''" }
    end
  end
end
