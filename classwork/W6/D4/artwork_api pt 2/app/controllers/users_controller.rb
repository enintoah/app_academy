class UsersController < ApplicationController

  def index
    if User.find(params :id)
    else
      @chirp = User.all
      render json: @chirp
    end
  end

  def create
    user = User.new(user_params)
    if user.save!
      render json: user
    else
      render json: user.errors.full_messages, status: :unprocessable_entity
    end
  end

  def show
    @chirp = User.find(params[:id])
    render json: @chirp
  end
  
  def update
      @chirp = User.find(params[:id])
      if @chirp.update(user_params)
        redirect_to user_url(params[:id])
      else
        render json: @chirp.errors.full_messages, status: 422
      end

  end

  def destroy  
    @chirp = User.find(params[:id])
    @chirp.destroy
    redirect_to user_url
  end
  
  private
  def user_params
    params.require(:user).permit(:name, :email)
  end  
end