class PostsController < ApplicationController
  def index
  end

  def new
    @post = Post.new
  end

  def create
    Post.create(post_params)
  end

  def edit
  end

  def show
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
