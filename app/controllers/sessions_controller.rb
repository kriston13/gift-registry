class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      prior_url = session[:return_to]
      session[:return_to] = nil
      redirect_to prior_url || root_url, notice: "You're now logged in"
    else
      flash.now.alert = "Email or password is invalid"
      render "new"
    end
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "You've been logged out"
  end
  
end
