class MainController < ApplicationController

before_action :is_authenticated?, except: [:index]
  def index
    @user = current_user
    @post = Post.where(session[:user_id])
  end
end
