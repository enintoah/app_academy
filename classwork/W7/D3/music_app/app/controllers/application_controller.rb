class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?
  skip_before_action :verify_authenticity_token


  def current_user
    st = session[:session_token]
    @current_user ||= User.find_by(session_token: st)
    if @current_user
      return @current_user
    end
    nil 
  end

  def logged_in?
    if current_user 
      return true 
    else 
      return false 
    end
  end

  def log_in_user!(user)
    session[:session_token] = user.reset_session_token!
    @current_user = user
  end
end
