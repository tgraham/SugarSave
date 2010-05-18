class CitiesController < ApplicationController
  load_and_authorize_resource
  
  def index
    @cities = City.all
  end
  
  def show
  end
  
  def new
  end
  
  def create
    if @city.save
      flash[:notice] = "Successfully created city."
      redirect_to cities_path
    else
      render :action => 'new'
    end
  end
  
  def edit
  end
  
  def update
    if @city.update_attributes(params[:city])
      flash[:notice] = "Successfully updated city."
      redirect_to @city
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @city.destroy
    flash[:notice] = "Successfully removed city."
    redirect_to cities_url
  end
end
