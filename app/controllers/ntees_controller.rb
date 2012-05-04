class NteesController < ApplicationController
  # GET /ntees
  # GET /ntees.json
  def index
    @ntees = Ntee.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @ntees }
    end
  end

  # GET /ntees/1
  # GET /ntees/1.json
  def show
    @ntee = Ntee.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @ntee }
    end
  end

  # GET /ntees/new
  # GET /ntees/new.json
  def new
    @ntee = Ntee.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @ntee }
    end
  end

  # GET /ntees/1/edit
  def edit
    @ntee = Ntee.find(params[:id])
  end

  # POST /ntees
  # POST /ntees.json
  def create
    @ntee = Ntee.new(params[:ntee])

    respond_to do |format|
      if @ntee.save
        format.html { redirect_to @ntee, :notice => 'Ntee was successfully created.' }
        format.json { render :json => @ntee, :status => :created, :location => @ntee }
      else
        format.html { render :action => "new" }
        format.json { render :json => @ntee.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /ntees/1
  # PUT /ntees/1.json
  def update
    @ntee = Ntee.find(params[:id])

    respond_to do |format|
      if @ntee.update_attributes(params[:ntee])
        format.html { redirect_to @ntee, :notice => 'Ntee was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @ntee.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /ntees/1
  # DELETE /ntees/1.json
  def destroy
    @ntee = Ntee.find(params[:id])
    @ntee.destroy

    respond_to do |format|
      format.html { redirect_to ntees_url }
      format.json { head :no_content }
    end
  end
end
