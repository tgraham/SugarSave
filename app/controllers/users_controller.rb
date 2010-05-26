class UsersController < ApplicationController
  load_and_authorize_resource
  
  def index
    @users = User.all
  end
  
  def new
  end
  
  def create
    if @user.save
      WelcomeMailer.welcome_email(@user).deliver
      flash[:notice] = "Registration Successful."
      if current_user.try(:role) == 'admin'
        redirect_to users_path
      else
        redirect_to login_path
      end
    else
      render :action => 'new'
    end
  end
  
  def edit
  end
  
  def update
    if @user.update_attributes(params[:user])
      city = City.where('id = ?', params[:user][:city_id]).last
      flash[:notice] = "Successfully updated user."
      if current_user.try(:role) == 'admin'
        redirect_to users_path
      else
        redirect_to '/'+city.search_name
      end
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @user.destroy
    flash[:notice] = "Successfully removed user."
    redirect_to users_url
  end
end
