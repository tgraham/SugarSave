class RecommendationsController < ApplicationController
  def new
    @recommendation = Recommendation.new
    @deal = Deal.find_by_id(params[:deal])
  end
  
  def create
    @recommendation = Recommendation.new(params[:recommendation])
    if @recommendation.save
      RecommendationMailer.recommendation_email(@recommendation).deliver
      flash[:notice] = "Successfully sent recommendation."
      redirect_to "/#{@recommendation.deal.city.search_name}"
    else
      render :action => 'new'
    end
  end
end
