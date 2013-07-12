module Skype
  response_filter /^ERROR / do |res|
    raise Skype::Error, res
  end

  class Error < StandardError
  end
end
