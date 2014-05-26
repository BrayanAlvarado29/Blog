class SessionsController < ApplicationController
	def new
		@user = User.new     
	end  
   def create
    user = User.find_by_username(params[:session][:username])
    if user && user.authenticate(params[:session])
      session[:username] = user.username
      session[:user_id] = user.id
      flash[:success] = "Successfully Logged in"
      redirect_to posts_path
    else
      flash.now[:warning] = "Invalid email or password"
      render "new"
    end
  end
  def destroy
    session[:user_id] = nil
    flash[:info] = "Logged out!"
    redirect_to root_url
  end
end 
