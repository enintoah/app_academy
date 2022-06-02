class SessionsController < ApplicationController

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.find_by_credentials(params[:session][:email], params[:session][:password])
    if @user 
      log_in_user!(@user)
      redirect_to user_url(@user.id)
    else 
      render :new 
    end  
  end

  def destroy
    @current_user = current_user
    session[:session_token] = nil
    @current_user.reset_session_token!
    redirect_to new_session_url
    @current_user = nil 
  end
end
