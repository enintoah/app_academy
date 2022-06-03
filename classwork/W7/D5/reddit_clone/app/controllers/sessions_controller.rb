class SessionsController < ApplicationController

   def create
      @user = User.find_by_credentials(params[:user][:username], params[:user][:password])
      if @user
         # debugger
        log_in(@user)
        redirect_to subs_url
      else
         # debugger
        @user = User.new(username: params[:user][:username])
        flash[:errors] = ['Invalid username or password']
        render :new
      end
   end

   def new
      @user = User.new
      render :new
   end

   def destroy
      logout!
      redirect_to new_session_url
   end
end
