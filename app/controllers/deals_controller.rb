class DealsController < ApplicationController
  load_and_authorize_resource
  
  def index
    @deals = Deal.includes(:city)
  end
  
  def show
    if params[:city_name]
      city = City.where(:name => params[:city_name].capitalize)
      
      @deal = Deal.where('city_id = ?', city).includes(:city).last
      
      if city.count == 0
        return redirect_to '/coming_soon'
      end
      
      if @deal.nil?
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
