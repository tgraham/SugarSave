class CompaniesController < ApplicationController
  load_and_authorize_resource
  
  def index
    @companies = Company.all
  end
  
  def show
  end
  
  def new
  end
  
  def create
    if @company.save
      flash[:notice] = "Successfully created company."
      redirect_to companies_url
    else
      render :action => 'new'
    end
  end
  
  def edit
  end
  
  def update
    if @company.update_attributes(params[:company])
      flash[:notice] = "Successfully updated company."
      redirect_to companies_url
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @company.destroy
    flash[:notice] = "Successfully removed company."
    redirect_to companies_url
  end
end
