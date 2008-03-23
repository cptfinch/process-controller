require File.dirname(__FILE__) + '/../../spec_helper'

describe "/prcesses/show.html.erb" do
  include PrcessesHelper
  
  before(:each) do
    @prcess = mock_model(Prcess)
    @prcess.stub!(:name).and_return("MyString")
    @prcess.stub!(:parent_id).and_return("1")
    @prcess.stub!(:value).and_return("1.5")

    assigns[:prcess] = @prcess
  end

  it "should render attributes in <p>" do
    render "/prcesses/show.html.erb"
    response.should have_text(/MyString/)
    response.should have_text(/1\.5/)
  end
end

