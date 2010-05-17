class UserSessionsController < ApplicationController
  def new
    @user_session = UserSession.new
  end
  
  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      flash[:notice] = "Successfully Logged In."
      if current_user.role == 'admin'
        redirect_to admin_url
      else
        redirect_to root_url
      end
    else
      render :action => 'new'
    end
  end
  
  def destroy
    @user_session = UserSession.find
    @user_session.destroy
    flash[:notice] = "Successfully Logged Out."
    redirect_to root_url
  end
end
