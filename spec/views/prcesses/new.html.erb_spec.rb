require File.dirname(__FILE__) + '/../../spec_helper'

describe "/prcesses/new.html.erb" do
  include PrcessesHelper
  
  before(:each) do
    @prcess = mock_model(Prcess)
    @prcess.stub!(:new_record?).and_return(true)
    @prcess.stub!(:name).and_return("MyString")
    @prcess.stub!(:parent_id).and_return("1")
    @prcess.stub!(:value).and_return("1.5")
    assigns[:prcess] = @prcess
  end

  it "should render new form" do
    render "/prcesses/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", prcesses_path) do
      with_tag("input#prcess_name[name=?]", "prcess[name]")
      with_tag("input#prcess_value[name=?]", "prcess[value]")
    end
  end
end


