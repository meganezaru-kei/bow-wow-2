class PostsController < ApplicationController
  before_action :set_target_post, only: %i[show edit update destroy]
  
  def index
    @posts = params[:tag_id].present? ? Tag.find(params[:tag_id]).posts : Post.all
    @posts = @posts.order(created_at: :desc).page(params[:page])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:notice] = "「#{@post.title}」を新規投稿しました"
      redirect_to @post
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      flash[:notice] = "「#{@post.title}」を更新しました"
      redirect_to @post
    else
      render :edit
    end
  end

  def show
    @comment = Comment.new(post_id: @post.id)
  end

  def destroy
    @post.destroy

    redirect_to posts_path, flash: { alert: "「#{@post.title}」を削除しました" }
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, tag_ids: [], images: []).merge(user_id: current_user.id)
  end

  def set_target_post
    @post = Post.find(params[:id])
  end
end
