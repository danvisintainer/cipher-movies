class UsersController < ApplicationController
  def show
    if !current_user
      redirect_to '/login' 
    else
      @watch_list = current_user.movies.all
    end
  end

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)

    if user.save
      session[:user_id] = user.id
      redirect_to '/'
    else
      redirect_to '/signup'
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

end
