# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'onsip/version'

Gem::Specification.new do |spec|
  spec.name          = "onsip"
  spec.version       = Onsip::VERSION
  spec.authors       = ["Brett Allred"]
  spec.email         = ["brettallred@gmail.com"]
  spec.summary       = %q{API wrapper for the onsip Admin API }
  spec.description   = %q{API wrapper for the onsip Admin API }
  spec.homepage      = "https://github.com/brettallred/onsip_ruby"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "httpclient"
  spec.add_dependency "activesupport"
  spec.add_dependency "json"

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "byebug"
end
