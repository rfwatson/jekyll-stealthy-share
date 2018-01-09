# encoding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'jekyll/stealthy_share/version'

Gem::Specification.new do |spec|
  spec.name          = "jekyll-stealthy-share"
  spec.version       = Jekyll::StealthyShare::VERSION
  spec.authors       = ["Rob Watson"]
  spec.email         = ["hello@netflux.io"]
  spec.description   = %q{Privacy-conscious share buttons for Jekyll}
  spec.summary       = spec.description
  spec.homepage      = "https://github.com/rfwatson"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "jekyll"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency 'capybara'
  spec.add_development_dependency 'byebug'
end
