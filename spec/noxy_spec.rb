require 'spec_helper'

describe Noxy do

  before do
    Noxy.configure do | n |
      n.key     = "1234secure6578"
      n.session = "whenifnotthenelse"
    end
  end

  it "should have a settings object" do
    expect(Noxy.configure).to eq(Noxy::Configuration)
  end

  it "should have a key object" do
    expect(Noxy.key).to eq("1234secure6578")
  end

  it "should have a key object" do
    expect(Noxy.session).to eq("whenifnotthenelse")
  end

end