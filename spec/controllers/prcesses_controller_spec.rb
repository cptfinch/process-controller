require File.dirname(__FILE__) + '/../spec_helper'

describe PrcessesController do
  describe "handling GET /prcesses" do

    before(:each) do
      @prcess = mock_model(Prcess)
      Prcess.stub!(:find).and_return([@prcess])
    end
  
    def do_get
      get :index
    end
  
    it "should be successful" do
      do_get
      response.should be_success
    end

    it "should render index template" do
      do_get
      response.should render_template('index')
    end
  
    it "should find all prcesses" do
      Prcess.should_receive(:find).with(:all).and_return([@prcess])
      do_get
    end
  
    it "should assign the found prcesses for the view" do
      do_get
      assigns[:prcesses].should == [@prcess]
    end
  end

  describe "handling GET /prcesses.xml" do

    before(:each) do
      @prcesses = mock("Array of Prcesses", :to_xml => "XML")
      Prcess.stub!(:find).and_return(@prcesses)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :index
    end
  
    it "should be successful" do
      do_get
      response.should be_success
    end

    it "should find all prcesses" do
      Prcess.should_receive(:find).with(:all).and_return(@prcesses)
      do_get
    end
  
    it "should render the found prcesses as xml" do
      @prcesses.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /prcesses/1" do

    before(:each) do
      @prcess = mock_model(Prcess)
      Prcess.stub!(:find).and_return(@prcess)
    end
  
    def do_get
      get :show, :id => "1"
    end

    it "should be successful" do
      do_get
      response.should be_success
    end
  
    it "should render show template" do
      do_get
      response.should render_template('show')
    end
  
    it "should find the prcess requested" do
      Prcess.should_receive(:find).with("1").and_return(@prcess)
      do_get
    end
  
    it "should assign the found prcess for the view" do
      do_get
      assigns[:prcess].should equal(@prcess)
    end
  end

  describe "handling GET /prcesses/1.xml" do

    before(:each) do
      @prcess = mock_model(Prcess, :to_xml => "XML")
      Prcess.stub!(:find).and_return(@prcess)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :show, :id => "1"
    end

    it "should be successful" do
      do_get
      response.should be_success
    end
  
    it "should find the prcess requested" do
      Prcess.should_receive(:find).with("1").and_return(@prcess)
      do_get
    end
  
    it "should render the found prcess as xml" do
      @prcess.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /prcesses/new" do

    before(:each) do
      @prcess = mock_model(Prcess)
      Prcess.stub!(:new).and_return(@prcess)
    end
  
    def do_get
      get :new
    end

    it "should be successful" do
      do_get
      response.should be_success
    end
  
    it "should render new template" do
      do_get
      response.should render_template('new')
    end
  
    it "should create an new prcess" do
      Prcess.should_receive(:new).and_return(@prcess)
      do_get
    end
  
    it "should not save the new prcess" do
      @prcess.should_not_receive(:save)
      do_get
    end
  
    it "should assign the new prcess for the view" do
      do_get
      assigns[:prcess].should equal(@prcess)
    end
  end

  describe "handling GET /prcesses/1/edit" do

    before(:each) do
      @prcess = mock_model(Prcess)
      Prcess.stub!(:find).and_return(@prcess)
    end
  
    def do_get
      get :edit, :id => "1"
    end

    it "should be successful" do
      do_get
      response.should be_success
    end
  
    it "should render edit template" do
      do_get
      response.should render_template('edit')
    end
  
    it "should find the prcess requested" do
      Prcess.should_receive(:find).and_return(@prcess)
      do_get
    end
  
    it "should assign the found Prcess for the view" do
      do_get
      assigns[:prcess].should equal(@prcess)
    end
  end

  describe "handling POST /prcesses" do

    before(:each) do
      @prcess = mock_model(Prcess, :to_param => "1")
      Prcess.stub!(:new).and_return(@prcess)
    end
    
    describe "with successful save" do
  
      def do_post
        @prcess.should_receive(:save).and_return(true)
        post :create, :prcess => {}
      end
  
      it "should create a new prcess" do
        Prcess.should_receive(:new).with({}).and_return(@prcess)
        do_post
      end

      it "should redirect to the new prcess" do
        do_post
        response.should redirect_to(prcess_url("1"))
      end
      
    end
    
    describe "with failed save" do

      def do_post
        @prcess.should_receive(:save).and_return(false)
        post :create, :prcess => {}
      end
  
      it "should re-render 'new'" do
        do_post
        response.should render_template('new')
      end
      
    end
  end

  describe "handling PUT /prcesses/1" do

    before(:each) do
      @prcess = mock_model(Prcess, :to_param => "1")
      Prcess.stub!(:find).and_return(@prcess)
    end
    
    describe "with successful update" do

      def do_put
        @prcess.should_receive(:update_attributes).and_return(true)
        put :update, :id => "1"
      end

      it "should find the prcess requested" do
        Prcess.should_receive(:find).with("1").and_return(@prcess)
        do_put
      end

      it "should update the found prcess" do
        do_put
        assigns(:prcess).should equal(@prcess)
      end

      it "should assign the found prcess for the view" do
        do_put
        assigns(:prcess).should equal(@prcess)
      end

      it "should redirect to the prcess" do
        do_put
        response.should redirect_to(prcess_url("1"))
      end

    end
    
    describe "with failed update" do

      def do_put
        @prcess.should_receive(:update_attributes).and_return(false)
        put :update, :id => "1"
      end

      it "should re-render 'edit'" do
        do_put
        response.should render_template('edit')
      end

    end
  end

  describe "handling DELETE /prcesses/1" do

    before(:each) do
      @prcess = mock_model(Prcess, :destroy => true)
      Prcess.stub!(:find).and_return(@prcess)
    end
  
    def do_delete
      delete :destroy, :id => "1"
    end

    it "should find the prcess requested" do
      Prcess.should_receive(:find).with("1").and_return(@prcess)
      do_delete
    end
  
    it "should call destroy on the found prcess" do
      @prcess.should_receive(:destroy)
      do_delete
    end
  
    it "should redirect to the prcesses list" do
      do_delete
      response.should redirect_to(prcesses_url)
    end
  end
end