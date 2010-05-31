class CharitiesController < ApplicationController
  load_and_authorize_resource
  
  def index
    @charities = Charity.all
  end
  
  def show
    @tweets = Twitter::Search.new('SugarSaveKnox').per_page(4)
  end
  
  def new
  end
  
  def create
    if @charity.save
      flash[:notice] = "Successfully created charity."
      redirect_to charities_path
    else
      render :action => 'new'
    end
  end
  
  def edit
  end
  
  def update
    if @charity.update_attributes(params[:charity])
      flash[:notice] = "Successfully updated charity."
      redirect_to @charity
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @charity.destroy
    flash[:notice] = "Successfully removed charity."
    redirect_to charities_url
  end
end
