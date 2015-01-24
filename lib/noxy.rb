# core
require "rack"
require "logger"
require "hashie"
require "omniauth-google-oauth2"
require "delegate"

# active_support
require 'active_support/core_ext/module/delegation'

# version
require "noxy/version"

# configuration
require "noxy/options"
require "noxy/configuration"

# domain validation
require "noxy/sinatra"


# Noxy module

module Noxy

  extend self

  # Make module configurable
  # @param [block] accepts a optional block
  # @return []

  def configure
    block_given? ? yield(Noxy::Configuration) : Noxy::Configuration
  end


  # Delegate all public
  # instance methods from Configuration to Noxy

  delegate(*(
    Noxy::Configuration.public_instance_methods(false) <<
    { to: Noxy::Configuration }))

end