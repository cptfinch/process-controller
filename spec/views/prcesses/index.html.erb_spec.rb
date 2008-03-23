require File.dirname(__FILE__) + '/../../spec_helper'

describe "/prcesses/index.html.erb" do
  include PrcessesHelper
  
  before(:each) do
    prcess_98 = mock_model(Prcess)
    prcess_98.should_receive(:name).and_return("MyString")
    prcess_98.should_receive(:parent_id).and_return("1")
    prcess_98.should_receive(:value).and_return("1.5")
    prcess_99 = mock_model(Prcess)
    prcess_99.should_receive(:name).and_return("MyString")
    prcess_99.should_receive(:parent_id).and_return("1")
    prcess_99.should_receive(:value).and_return("1.5")

    assigns[:prcesses] = [prcess_98, prcess_99]
  end

  it "should render list of prcesses" do
    render "/prcesses/index.html.erb"
    response.should have_tag("tr>td", "MyString", 2)
    response.should have_tag("tr>td", "1.5", 2)
  end
end

