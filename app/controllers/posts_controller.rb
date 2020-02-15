class PostsController < ApplicationController
  before_action :set_target_post, only: %i[show edit update destroy]
  
  def index
    @posts = Post.page(params[:page])
  end

  def new
    @post = Post.new(flash[:post])
  end

  def create
    post = Post.new(post_params)
    if post.save
      flash[:notice] = "「#{post.title}」を新規投稿しました"
      redirect_to post
    else
      redirect_to new_post_path, flash: {
        post: post,
        error_messages: post.errors.full_messages
      }
    end
  end

  def edit
    flash[:post] if flash[:post]
  end

  def update
    if @post.update(post_params)
      flash[:notice] = "「#{@post.title}」を更新しました"
      redirect_to @post
    else
      redirect_back(fallback_location: edit_post_path(@post), flash: {
        post: @post,
        error_messages: @post.errors.full_messages
      })
    end
  end

  def show
    @comment = Comment.new(post_id: @post.id)
  end

  def destroy
    @post.delete

    redirect_to posts_path, flash: { notice: "「#{@post.title}」を削除しました" }
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end

  def set_target_post
    @post = Post.find(params[:id])
  end
end
