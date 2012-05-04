class CommonCodesController < ApplicationController
  # GET /common_codes
  # GET /common_codes.json
  def index
    @common_codes = CommonCode.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @common_codes }
    end
  end

  # GET /common_codes/1
  # GET /common_codes/1.json
  def show
    @common_code = CommonCode.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @common_code }
    end
  end

  # GET /common_codes/new
  # GET /common_codes/new.json
  def new
    @common_code = CommonCode.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @common_code }
    end
  end

  # GET /common_codes/1/edit
  def edit
    @common_code = CommonCode.find(params[:id])
  end

  # POST /common_codes
  # POST /common_codes.json
  def create
    @common_code = CommonCode.new(params[:common_code])

    respond_to do |format|
      if @common_code.save
        format.html { redirect_to @common_code, :notice => 'Common code was successfully created.' }
        format.json { render :json => @common_code, :status => :created, :location => @common_code }
      else
        format.html { render :action => "new" }
        format.json { render :json => @common_code.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /common_codes/1
  # PUT /common_codes/1.json
  def update
    @common_code = CommonCode.find(params[:id])

    respond_to do |format|
      if @common_code.update_attributes(params[:common_code])
        format.html { redirect_to @common_code, :notice => 'Common code was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @common_code.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /common_codes/1
  # DELETE /common_codes/1.json
  def destroy
    @common_code = CommonCode.find(params[:id])
    @common_code.destroy

    respond_to do |format|
      format.html { redirect_to common_codes_url }
      format.json { head :no_content }
    end
  end
end
