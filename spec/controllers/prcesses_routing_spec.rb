require File.dirname(__FILE__) + '/../spec_helper'

describe PrcessesController do
  describe "route generation" do

    it "should map { :controller => 'prcesses', :action => 'index' } to /prcesses" do
      route_for(:controller => "prcesses", :action => "index").should == "/prcesses"
    end
  
    it "should map { :controller => 'prcesses', :action => 'new' } to /prcesses/new" do
      route_for(:controller => "prcesses", :action => "new").should == "/prcesses/new"
    end
  
    it "should map { :controller => 'prcesses', :action => 'show', :id => 1 } to /prcesses/1" do
      route_for(:controller => "prcesses", :action => "show", :id => 1).should == "/prcesses/1"
    end
  
    it "should map { :controller => 'prcesses', :action => 'edit', :id => 1 } to /prcesses/1/edit" do
      route_for(:controller => "prcesses", :action => "edit", :id => 1).should == "/prcesses/1/edit"
    end
  
    it "should map { :controller => 'prcesses', :action => 'update', :id => 1} to /prcesses/1" do
      route_for(:controller => "prcesses", :action => "update", :id => 1).should == "/prcesses/1"
    end
  
    it "should map { :controller => 'prcesses', :action => 'destroy', :id => 1} to /prcesses/1" do
      route_for(:controller => "prcesses", :action => "destroy", :id => 1).should == "/prcesses/1"
    end
  end

  describe "route recognition" do

    it "should generate params { :controller => 'prcesses', action => 'index' } from GET /prcesses" do
      params_from(:get, "/prcesses").should == {:controller => "prcesses", :action => "index"}
    end
  
    it "should generate params { :controller => 'prcesses', action => 'new' } from GET /prcesses/new" do
      params_from(:get, "/prcesses/new").should == {:controller => "prcesses", :action => "new"}
    end
  
    it "should generate params { :controller => 'prcesses', action => 'create' } from POST /prcesses" do
      params_from(:post, "/prcesses").should == {:controller => "prcesses", :action => "create"}
    end
  
    it "should generate params { :controller => 'prcesses', action => 'show', id => '1' } from GET /prcesses/1" do
      params_from(:get, "/prcesses/1").should == {:controller => "prcesses", :action => "show", :id => "1"}
    end
  
    it "should generate params { :controller => 'prcesses', action => 'edit', id => '1' } from GET /prcesses/1;edit" do
      params_from(:get, "/prcesses/1/edit").should == {:controller => "prcesses", :action => "edit", :id => "1"}
    end
  
    it "should generate params { :controller => 'prcesses', action => 'update', id => '1' } from PUT /prcesses/1" do
      params_from(:put, "/prcesses/1").should == {:controller => "prcesses", :action => "update", :id => "1"}
    end
  
    it "should generate params { :controller => 'prcesses', action => 'destroy', id => '1' } from DELETE /prcesses/1" do
      params_from(:delete, "/prcesses/1").should == {:controller => "prcesses", :action => "destroy", :id => "1"}
    end
  end
end