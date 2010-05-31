class ApplicationController < ActionController::Base
  helper_method :current_user_session, :current_user, :require_no_user
  
  protect_from_forgery
  layout 'application'
  
  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = "Access denied."
    redirect_to root_url
  end
  
  private
    def current_user_session
      return @current_user_session if defined?(@current_user_session)
      @current_user_session = UserSession.find
    end

    def current_user
      return @current_user if defined?(@current_user)
      @current_user = current_user_session && current_user_session.user
    end
    
    def require_no_user
      if current_user
        flash[:notice] = "You must be logged out to access this page"
        if current_user.try(:role) == 'admin'
          redirect_to users_path
        else
          redirect_to '/'+city.search_name
        end
        return false
      end
    end
    
end
