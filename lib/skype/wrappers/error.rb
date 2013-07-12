module Skype
  response_filter /^ERROR / do |res|
    raise Skype::APIError, res
  end

  class APIError < StandardError
  end
end
