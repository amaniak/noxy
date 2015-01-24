require 'rubygems'
require 'bundler/setup'
require 'noxy'

RSpec.configure do |config|
  config.color = true
  config.formatter     = 'documentation'
end