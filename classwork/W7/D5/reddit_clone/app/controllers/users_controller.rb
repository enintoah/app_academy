class UsersController < ApplicationController
    def new
        @user = User.new
        render :new
    end

    def index
        @users = User.all
        render :index
    end

    def create
        @user = User.new(valid_params)
        if @user.save
            log_in(@user)
            redirect_to users_url
        else
            flash.now[:errors] = @user.errors.full_messages
            render :new
        end

    end

    def show
        @user = User.find_by(id: params[:id])
        render :show
    end

    def destroy
        @user = User.find_by(id: params[:id])
        @user.destroy
        redirect_to new_session_url
    end

    private
    def valid_params
      params.require(:user).permit(:username, :password)
    end
end
