class UsersController < ApplicationController
	def new
		@user = User.new
	end
  def index
  end 
  def create 
	 	@user = User.new(user_params)
	    if @user.save
	      redirect_to posts_path, notice: 'User was successfully created.'
	    else
	      render action: "new"
	    end
	end
	private 
	def user_params
      params.require(:user).permit(:username, :password, :confirmPassword)
  end
  def show
	  @user = User.find(params[:id])
	  @post = @user.post.build
	  @user_posts = @user.posts.order("created_at DESC")
  end
end

