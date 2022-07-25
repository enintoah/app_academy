class Api::SessionsController < ApplicationController
    # before_action :require_signed_in!, only: [:destroy]

    def new
      render :new
    end
  
    def create
      @user = User.find_by_credentials(
        params[:user][:username],
        params[:user][:password]
      )
  
      if @user
        sign_in!(@user)
        render json: @user 
      else
        render ['Invalid username or password'] 
      end
    end
  
    def destroy
      if sign_out!
        render json: ["successful logout"]
      else
        render json: ["not a successful logout"]
      end
    end
end
