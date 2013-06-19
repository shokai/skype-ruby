# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'skype/version'

Gem::Specification.new do |spec|
  spec.name          = "skype"
  spec.version       = Skype::VERSION
  spec.authors       = ["Sho Hashimoto"]
  spec.email         = ["hashimoto@shokai.org"]
  spec.description   = %q{Skype Desktop API wrapper for Ruby}
  spec.summary       = spec.description
  spec.homepage      = "https://github.com/shokai/skype-ruby"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "rb-appscript"
  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
