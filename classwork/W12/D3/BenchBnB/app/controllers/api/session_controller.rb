class Api::SessionController < ApplicationController
    before_action :require_signed_in!, only: [:destroy]

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
      else
        render ['Invalid username or password'] 
      end
    end
  
    def destroy
      if sign_out!
        render :destroy
      else
        render json: "hello"
      end
    end
end
