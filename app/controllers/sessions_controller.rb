class SessionsController < ApplicationController

  before_action :is_logged_in?, only: [:new, :create]

  def new
  end

  def create
     user = User.authenticate(params[:user][:email],
      params[:user][:password])

     if user
      session[:user_id] = user.id
      flash[:success] = 'You are now logged in.'
      redirect_to root_path
     else
      flash[:danger] = 'Invalid email or password.'
      redirect_to login_path
     end
  end

  def destroy
     session[:user_id] = nil
     flash[:info] = 'You are logged out.'
     redirect_to login_path
  end
end