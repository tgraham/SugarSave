class StaticController < ApplicationController
  def index
    render :layout => 'welcome'
  end
  
  def dashboard
  end
end
