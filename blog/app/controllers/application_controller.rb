class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #protect_from_forgery with: :exception
  
  #  def sign_in(user)
  #   session[:user_id] = user.id
  #   self.current_user = user
  # end
  
  # getter method
  private 
   def current_user
    @current_user ||= session[:user_id] && User.find(session[:user_id])
  end

  def current_user?(user)
    user == current_user 
  end

  # def deny_access
  #   redirect_to session_path, :notice => "Please sign in to access this page."
  # end
  
end
