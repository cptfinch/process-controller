class PrcessesController < ApplicationController
  # GET /prcesses
  # GET /prcesses.xml
  def index
    @prcesses = Prcess.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @prcesses }
    end
  end

  # GET /prcesses/1
  # GET /prcesses/1.xml
  def show
    @prcess = Prcess.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @prcess }
    end
  end

  # GET /prcesses/new
  # GET /prcesses/new.xml
  def new
    @prcess = Prcess.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @prcess }
    end
  end

  # GET /prcesses/1/edit
  def edit
    @prcess = Prcess.find(params[:id])
  end

  # POST /prcesses
  # POST /prcesses.xml
  def create
    @prcess = Prcess.new(params[:prcess])

    respond_to do |format|
      if @prcess.save
        flash[:notice] = 'Prcess was successfully created.'
        format.html { redirect_to(@prcess) }
        format.xml  { render :xml => @prcess, :status => :created, :location => @prcess }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @prcess.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /prcesses/1
  # PUT /prcesses/1.xml
  def update
    @prcess = Prcess.find(params[:id])

    respond_to do |format|
      if @prcess.update_attributes(params[:prcess])
        flash[:notice] = 'Prcess was successfully updated.'
        format.html { redirect_to(@prcess) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @prcess.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /prcesses/1
  # DELETE /prcesses/1.xml
  def destroy
    @prcess = Prcess.find(params[:id])
    @prcess.destroy

    respond_to do |format|
      format.html { redirect_to(prcesses_url) }
      format.xml  { head :ok }
    end
  end
end
