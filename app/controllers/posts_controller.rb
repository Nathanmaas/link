class PostsController < ApplicationController

  before_action :is_authenticated?

  def index
    @posts = Post.all
  end

  def new
    # @user = current_user
    @post = Post.new
  end

  def create
   if @current_user.posts.create(post_params).valid?
      redirect_to posts_path
    else
      flash[:danger] = "Invalid post"
      redirect_to new_post_path
    end
  end
private
  def post_params
    params.require(:post).permit(:title, :link)
  end
end

