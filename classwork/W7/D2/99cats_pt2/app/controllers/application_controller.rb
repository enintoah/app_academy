class ApplicationController < ActionController::Base
  helper_method :current_user
  
  def current_user
    token = session[:session_token]
    @current_user = User.find_by(session_token: token)
    return @current_user if @current_user
    return nil 
  end

  def login_user!(user)
    user.reset_session_token!
    session[:session_token] = user.session_token
    redirect_to cats_url
  end

  def logged_in?
    !!current_user
  end

  def require_logged_out
    redirect_to cats_url if logged_in?
  end

end
