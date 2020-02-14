class PostsController < ApplicationController
  before_action :set_target_post, only: %i[show edit update destroy]
  
  def index
    @posts = Post.page(params[:page])
  end

  def new
    @post = Post.new
  end

  def create
    post = Post.create(post_params)
    redirect_to post
  end

  def edit
  end

  def update
    @post.update(post_params)

    redirect_to @post
  end

  def show
  end

  def destroy
    @post.delete

    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end

  def set_target_post
    @post = Post.find(params[:id])
  end
end
