class PostsController < ApplicationController
  before_action :set_target_post, only: %i[show edit update destroy]
  
  def index
    @posts = params[:tag_id].present? ? Tag.find(params[:tag_id]).posts : Post.all
    @posts = @posts.with_attached_images.order(created_at: :desc).page(params[:page])
  end

  def search
    @q = Post.search(search_params)
    @posts = @q.result.with_attached_images.order(created_at: :desc).page(params[:page])
  end

  def new
    @post = Post.new
    @images_count = @post.images.length.to_i

    @category_parent_array = []
    Category.where(ancestry: nil).each do |parent|
      @category_parent_array << parent.name
    end
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:notice] = "「#{@post.title}」を新規投稿しました"
      redirect_to @post
    else
      @images_count = @post.images.length.to_i
      render :new
    end
  end

  def edit
    @images_count = @post.images.length.to_i

    @category_parent_array = ["---"]
    Category.where(ancestry: nil).each do |parent|
      @category_parent_array << parent.name
    end

    @category_child_array = [{id: "---", name: "---"}]
    @parent = Category.find_by(name: @post.parent_category)
    @parent.children.each do |child|
      @category_child_array += [{id: child.id, name: child.name}]
    end
  end

  def update
    if @post.update(post_params)
      if params[:post][:images_blob_ids]
        delete_images
      end
      flash[:notice] = "「#{@post.title}」を更新しました"
      redirect_to @post
    else
      @images_count = @post.images.length.to_i
      render :edit
    end
  end

  def show
    @comment = Comment.new(post_id: @post.id)
    @comments = @post.comments.includes(user: { image_attachment: :blob } )
    @user_posts = Post.with_attached_images.order(created_at: :desc).where(user_id: @post.user.id).where.not(id: @post.id).limit(3)
    @new_posts = Post.with_attached_images.order(created_at: :desc).where.not(id: @post.id, user_id: @post.user.id).limit(3)
  end

  def destroy
    @post.destroy

    redirect_to posts_path, flash: { alert: "「#{@post.title}」を削除しました" }
  end

  def get_category_children
    @category_children = Category.find_by(name: "#{params[:parent_name]}", ancestry: nil).children
  end

  private

  def post_params
    params.require(:post).permit(
      :title, 
      :body, 
      :parent_category, 
      :child_category, 
      tag_ids: [], 
      images: []).merge(user_id: current_user.id)
  end

  def set_target_post
    @post = Post.with_attached_images.find(params[:id])
  end

  def delete_images
    params[:post][:images_blob_ids].each do |image_id|
      image = @post.images.find(image_id)
      image.purge
    end
  end

  def search_params
    params.require(:q).permit(:title_cont)
  end

end
