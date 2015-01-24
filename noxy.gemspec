# coding: utf-8

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'noxy/version'

Gem::Specification.new do |gem|

  gem.name          = "noxy"
  gem.version       = Noxy::VERSION
  gem.authors       = ["DK"]
  gem.email         = ["amaniak@noxqs.nl"]
  gem.summary       = %q{Google Apps domain authentication}
  gem.description   = %q{Basic support for Google Apps authentication}
  gem.homepage      = "http://noxqs.nl"
  gem.license       = "MIT"


  gem.files         = `git ls-files -z`.split("\x0")
  gem.executables   = gem.files.grep(%r{^bin/}) { |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency "hashie"
  gem.add_dependency "sinatra-contrib"
  gem.add_dependency "omniauth-google-oauth2"
  gem.add_dependency "activesupport"

  gem.add_development_dependency "bundler", "~> 1.7"
  gem.add_development_dependency "rake", "~> 10.0"
  gem.add_development_dependency "pry"
  gem.add_development_dependency "rspec"
  gem.add_development_dependency "rack-test"
  gem.add_development_dependency "yard"
end
