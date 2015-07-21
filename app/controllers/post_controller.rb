class PostController < ApplicationController

  before_action :is_authenticated?

  def new
    @user = current_user
    @post = Post.new
  end

  def create
    @user = current_user
    @post = Post.create(post_params)

    if @post.save
      flash[:success] = "Your post has been added"
      redirect_to root_path
    else
      render 'new'
    end
  end
end
