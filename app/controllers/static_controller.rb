class StaticController < ApplicationController
  def index
    render :layout => 'welcome'
  end
  
  def dashboard
  end
  
  def coming_soon
  end
end
