class ApplicationController < ActionController::Base
  protect_from_forgery
  
  
private

  def current_user
      logger.debug "getting current_user"
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def authorize
    if current_user.nil?
      flash[:alert] = "You need to login to complete this step"
      session[:return_to] = request.url
      redirect_to login_url
    end
  end

end
