class UsersController < ApplicationController
  before_action :require_logged_out, only: [:create, :new]

  def create
    user = User.new(valid_params)
    if user.save
      login_user!(user)
    else
      render :new
    end
  end

  def new
    @user = User.new
    render :new
  end

  private
  def valid_params
    params.require(:user).permit(:user_name, :password)
  end

end
