class UsersController < ApplicationController

  before_action :is_logged_in?, only: [:new]

  def new
  end

  def create
    if User.create(user_params).valid?
      flash[:success] = "User has been created"
      redirect_to login_path
    else
      flash[:danger] = "Invalid"
      redirect_to signup_path
    end
  end
private
  def user_params
    params.require(:user).permit(:email, :name, :password)
  end
end
