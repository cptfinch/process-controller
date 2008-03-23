require File.dirname(__FILE__) + '/../../spec_helper'

describe "/prcesses/edit.html.erb" do
  include PrcessesHelper
  
  before do
    @prcess = mock_model(Prcess)
    @prcess.stub!(:name).and_return("MyString")
    @prcess.stub!(:parent_id).and_return("1")
    @prcess.stub!(:value).and_return("1.5")
    assigns[:prcess] = @prcess
  end

  it "should render edit form" do
    render "/prcesses/edit.html.erb"
    
    response.should have_tag("form[action=#{prcess_path(@prcess)}][method=post]") do
      with_tag('input#prcess_name[name=?]', "prcess[name]")
      with_tag('input#prcess_value[name=?]', "prcess[value]")
    end
  end
end


