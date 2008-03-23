require File.dirname(__FILE__) + '/../spec_helper'

describe Prcess do
  before(:each) do
    @prcess = Prcess.new
  end

  it "should be valid" do
    @prcess.should be_valid
  end
end
