class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.save
      flash[:success] = "User has been created"
      redirect_to login_path
    else
      render 'new'
    end
  end
end