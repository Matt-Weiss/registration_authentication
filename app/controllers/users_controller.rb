class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    if User.find_by(email: user_params[:email])
      flash.now[:error] = "User with that email already exists"
      redirect_to new_user_path
    else
      @user = User.new(user_params)
      if @user.save
        flash.now[:notice] = "Thanks for registering!"
        redirect_to users_path
      else
        flash.now[:error] = "Could not save user"
        redirect_to new_user_path
      end
    end
  end


  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

end
