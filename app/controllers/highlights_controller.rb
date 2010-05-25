class HighlightsController < ApplicationController
  load_and_authorize_resource
  
  def create
    @highlight = Highlight.new(params[:highlight])
    if @highlight.save
      flash[:notice] = "Successfully created highlight."
      redirect_to @highlight
    else
      render :action => 'new'
    end
  end

  def update
    @highlight = Highlight.find(params[:id])
    if @highlight.update_attributes(params[:highlight])
      flash[:notice] = "Successfully updated highlight."
      redirect_to @highlight
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @highlight = Highlight.find(params[:id])
    @highlight.destroy
    flash[:notice] = "Successfully destroyed highlight."
    redirect_to highlights_url
  end
end
