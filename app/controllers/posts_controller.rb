class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    new_post = Post.create(post_params)
    redirect_to post_path(new_post)
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    post = Post.find(params[:id])
    post.update(post_params)
    redirect_to post_path(post)
  end

  def destroy
    Post.delete(params[:id])
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :message, :user_id)
  end
end
