class DealsController < ApplicationController
  load_and_authorize_resource
  
  def index
    @deals = Deal.includes(:city)
  end
  
  def show
    if params[:city_name]
      city_name = params[:city_name].gsub(/ /, "").capitalize
      city = City.where(:name => city_name)
      
      @deal = Deal.where('city_id = ?', city).includes(:city).last
      
      if city.count == 0
        # Need to redirect to form so user can request a city
        return redirect_to '/coming_soon'
      end
      
      if @deal.nil?
        # Need to add custom deal mesage for city
        return redirect_to '/coming_soon'
      end
    else
      redirect_to root_path
    end
  end
  
  def new
  end
  
  def create
    if @deal.save
      flash[:notice] = "Successfully created deal."
      redirect_to deals_path
    else
      render :action => 'new'
    end
  end
  
  def edit
  end
  
  def update
    if @deal.update_attributes(params[:deal])
      flash[:notice] = "Successfully updated deal."
      redirect_to deals_path
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @deal.destroy
    flash[:notice] = "Successfully destroyed deal."
    redirect_to deals_url
  end
end
