module Skype
  @@filters = {}

  def self.response_filter(pattern, &block)
    raise ArgumentError, "pattern must be instance of Regexp" unless pattern.kind_of? Regexp
    raise ArgumentError, "block not given" unless block_given?
    @@filters[pattern] = block
  end
end
