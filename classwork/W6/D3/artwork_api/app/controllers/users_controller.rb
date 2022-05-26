class UsersController < ApplicationController

  def index
    @chirp = User.all
    render json: @chirp
  end

  def create
    user = User.new(params.require(:user).permit(:name, :email))
  # replace the `user_attributes_here` with the actual attribute keys

    if user.save
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
      if @chirp.update(banana_params)
        # redirect_to show_user_url(@chirp)
        redirect_to show_user_url(params[:id])
      else
        render json: @chirp.errors.full_messages, status: 422
      end

  end
  
  def banana_params
    params.require(:user).permit(:name, :email)
  end  

  def destroy  
    @chirp = User.find(params[:id])
    @chirp.destroy
    redirect_to index_user_url
  end



end