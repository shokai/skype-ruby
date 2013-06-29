module Skype
  @@filters = {}

  def self.response_filter(pattern, &block)
    raise ArgumentError, "pattern must be instance of Regexp" unless pattern.kind_of? Regexp
    raise ArgumentError, "block not given" unless block_given?
    @@filters[pattern] = block
  end

  def self.filter_response(response_string)
    @@filters.each do |filter, block|
      next unless response_string =~ filter
      response_string = block.call(response_string)
      break
    end
    response_string
  end

end
