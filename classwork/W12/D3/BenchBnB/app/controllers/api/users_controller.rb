class Api::UsersController < ApplicationController
     def show
       render :show
     end

    def create
      @user = User.new(user_params)
      if @user.save
        sign_in!(@user)
      else
        # flash.now[:errors] = @user.errors.full_messages?
        render json: @user
      end
    end

  def user_params
    params.require(:user).permit(:password, :username, :email)
  end

end
