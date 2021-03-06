class SessionsController < ApplicationController
  before_action :require_logged_out, only: [:new, :create]

  def new
    render :new
  end

  def create
    user = User.find_by_credentials(params[:user][:user_name], params[:user][:password])
    if user
      login_user!(user)
      # user.reset_session_token!
      # session[:session_token] = user.session_token
      # redirect_to cats_url
    else
      render :new
    end
  end

  def destroy
    if current_user
      current_user.reset_session_token!
      session[:session_token] = nil
    end
  end
end
