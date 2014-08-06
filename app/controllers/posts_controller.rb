class PostsController < ApplicationController
  def index
    @users = User.all
    @posts = Post.all
    compiled = {users: @users, posts: @posts}
    respond_to do |format|
      format.json {render :json => compiled.to_json}
      format.html
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    new_post = Post.create(post_params)
    # redirect_to post_path(new_post)
    redirect_to root_path
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    post = Post.find(params[:id])
    post.update(post_params)
    # redirect_to post_path(post)
    redirect_to root_path
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
