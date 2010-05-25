class FinePrintsController < ApplicationController
  load_and_authorize_resource
  
  def index
    @fine_prints = FinePrint.all
  end
  
  def show
    @fine_print = FinePrint.find(params[:id])
  end
  
  def new
    @fine_print = FinePrint.new
  end
  
  def create
    @fine_print = FinePrint.new(params[:fine_print])
    if @fine_print.save
      flash[:notice] = "Successfully created fine print."
      redirect_to @fine_print
    else
      render :action => 'new'
    end
  end
  
  def edit
    @fine_print = FinePrint.find(params[:id])
  end
  
  def update
    @fine_print = FinePrint.find(params[:id])
    if @fine_print.update_attributes(params[:fine_print])
      flash[:notice] = "Successfully updated fine print."
      redirect_to @fine_print
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @fine_print = FinePrint.find(params[:id])
    @fine_print.destroy
    flash[:notice] = "Successfully destroyed fine print."
    redirect_to fine_prints_url
  end
end
