class UsersController < ApplicationController
  def show
    @user = User.find_by(id: params[:id])
    render :show  
  end

  def new
    render :new
  end

  def create
    user = User.new(valid_params)
    if user.save!
      redirect_to user_url(user.id)
    else 
      render :new
    end
  end

  private
  def valid_params
    params.require(:user).permit(:email, :password)
  end
end
