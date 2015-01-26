require 'spec_helper'
require 'securerandom'

describe Noxy do

  before do

    @app = "Tindr"
    @session = SecureRandom.hex(16)
    @client = SecureRandom.hex(16)
    @secret = SecureRandom.hex(16)
    @proxy = lambda {}

    Noxy.configure do | n |
      n.app     = @app
      n.session = @session
      n.client  = @client
      n.secret  = @secret
      n.proxy   = @proxy
    end
  end

  it "should have a settings object" do
    expect(Noxy.configure).to eq(Noxy::Configuration)
  end

  it "should have a app property" do
    expect(Noxy.app).to eq(@app)
  end

  it "should have a session object" do
    expect(Noxy.session).to eq(@session)
  end

  it "should have a client object" do
    expect(Noxy.client).to eq(@client)
  end

  it "should have a secret object" do
    expect(Noxy.secret).to eq(@secret)
  end

  it "should have a proxy object" do
    expect(Noxy.proxy).to eq(@proxy)
  end

end