class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    # Authenticate user's password
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to '/'
    #If creating the session fails, redirect to login and display a message
    else
      flash[:notice] = "Failed to log in. Please try again."
      redirect_to '/'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end
end
