class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user
  helper_method :signed_in?

  # before_action :require_login

  def current_user
  	return @current_user if @current_user

  	if session[:user_id]
  	@current_user = User.find_by_id (session[:user_id])
  	end
  end

  def signed_in?
  	current_user != nil
  end

  private

  def require_login
  	unless signed_in?
  		flash.now[:error] = "You must sign in to see this page!"
  		redirect_to login_path
  	end
  end

  def skip_if_logged_in
  	unless !signed_in?
  		redirect_to users_path
  	end
  end
end
