class PaymentProfilesController < ApplicationController
  load_and_authorize_resource
    
  $states = State.all  
  
  def new
    @payment_profile = PaymentProfile.new(:user_id => params[:user_id])
  end
  
  def create
    state = State.find(params[:payment_profile][:state])
    @payment_profile.state = state.name

    if @payment_profile.save
      if current_user.try(:role) == 'admin'
        redirect_to users_path
      else
        redirect_to user_path(current_user)
      end
    else
      render :action => 'new'
    end
  end
  
  def show
  end
  
  def edit
  end
  
  def update
    state = State.find(params[:payment_profile][:state])
    @payment_profile.state = state.name
    
    if @payment_profile.update_attributes(params[:payment_profile])
      flash[:notice] = "Billing information updated."
      if current_user.try(:role) == 'admin'
        redirect_to users_path
      else
        redirect_to user_path(current_user)
      end
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @payment_profile.destroy
    flash[:notice] = "Successfully removed billing information."
    redirect_to user_path(current_user)
  end
end
