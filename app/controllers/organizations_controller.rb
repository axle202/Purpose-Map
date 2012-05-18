class OrganizationsController < ApplicationController
  # GET /organizations
  def index
    @organizations  = if params[:search].present?
                        radius = 5
                        Organization.near(params[:search], radius, :order => :distance)
                      else
                        Organization.all
                      end
  end

  # GET /organizations/1
  def show
    @organization = Organization.find(params[:id])
  end

  # GET /organizations/new
  def new
    @organization = Organization.new
  end

  # GET /organizations/1/edit
  def edit
    @organization = Organization.find(params[:id])
  end

  # POST /organizations
  def create
    @organization = Organization.new(params[:organization])

    if @organization.save
      redirect_to @organization, :notice => 'Organization was successfully created.'
    else
      render :action => "new"
    end
  end

  # PUT /organizations/1
  def update
    @organization = Organization.find(params[:id])

    if @organization.update_attributes(params[:organization])
      redirect_to @organization, :notice => 'Organization was successfully updated.'
    else
      render :action => "edit"
    end
  end

  # DELETE /organizations/1
  def destroy
    @organization = Organization.find(params[:id])
    @organization.destroy
  end
end
