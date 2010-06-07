class DealsController < ApplicationController
  load_and_authorize_resource
  
  def index
    @deals = Deal.order("deal_date desc").limit(10).includes(:city)
  end
  
  def show
    if params[:city_name]
      city = City.where(:search_name => params[:city_name])
      @cities = City.includes(:state)
      
      if city.count == 0
        # Need to redirect to form so user can request a city
        return render :city_request
      end
      
      today = Date.current.strftime("%Y-%m-%d").to_s
      weekend = 2.days.from_now.strftime("%Y-%m-%d").to_s
      
      @deal = Deal.where('city_id = ?', city).where('deal_date <= ? and end_date >= ?', today, today).where('approved = ?', true).includes(:city).last
      
      if @deal.nil?
        # Need to add custom deal mesage for city
        return render :coming_soon
      end
      
      @charity = Charity.where('city_id = ?', city).where('start_date <= ? and end_date >= ?', today, today).includes(:city).last
      @tweets = Twitter::Search.new('SugarSaveKnox').per_page(4)
    else
      redirect_to root_path
    end
  end
  
  def preview
    if params[:id]
      today = Date.current.strftime("%Y-%m-%d").to_s
      
      @deal = Deal.where('id = ?', params[:id]).includes(:city).last
      @charity = Charity.where('start_date <= ? and end_date >= ?', today, today).includes(:city).last
      @tweets = Twitter::Search.new('SugarSaveKnox').per_page(4)
    end
      
    render :show
  end
  
  def new
    5.times { @deal.fine_prints.build }
    5.times { @deal.highlights.build }
  end
  
  def create
    if @deal.weekend?
      @deal.end_date = @deal.deal_date + 2
    else
      @deal.end_date = @deal.deal_date
    end
    
    if @deal.save
      flash[:notice] = "Successfully created deal."
      redirect_to deals_path
    else
      render :action => 'new'
    end
  end
  
  def edit
    deal_count = 5 - @deal.fine_prints.count
    highlight_count = 5 - @deal.highlights.count
    
    deal_count.to_i.times { @deal.fine_prints.build }
    highlight_count.to_i.times { @deal.highlights.build }
  end
  
  def update
    if @deal.weekend == true
      @deal.end_date = @deal.deal_date + 2
    else
      @deal.end_date = @deal.deal_date
    end
    
    if @deal.update_attributes(params[:deal])
      flash[:notice] = "Successfully updated deal."
      redirect_to deals_path
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @deal.destroy
    flash[:notice] = "Successfully removed deal."
    redirect_to deals_url
  end
end
