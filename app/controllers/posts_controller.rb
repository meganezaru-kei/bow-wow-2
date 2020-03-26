class PostsController < ApplicationController
  before_action :set_target_post, only: %i[show edit update destroy]

  def index
    @category_parent_array = ['犬種で絞り込み']
    Category.parent_name_set(@category_parent_array)

    @category_child_array = []
    if @q.child_category_eq
      @category_child_array = Category.child_name_set(@category_child_array, @q)
    end

    @params = params[:q][:child_category_eq] if params[:q]
    @posts = params[:q].present? ? Post.category(@params) : Post.all
    @posts = @posts.with_attached_images.recent.page(params[:page])
  end

  def search
    @q = Post.search(search_params)
    @posts_length = @q.result.length
    @posts = @q.result.with_attached_images.recent.page(params[:page])
  end

  def new
    @post = Post.new
    @images_count = @post.images.length.to_i

    @category_parent_array = ['---', '大型犬', '中型犬', '小型犬']
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      tag_list = tag_params[:tag_names].gsub(/[[:space:]]/, '').split(',').uniq
      @post.save_tags(tag_list)
      flash[:notice] = "「#{@post.title}」を新規投稿しました"
      redirect_to @post
    else
      @images_count = @post.images.length.to_i
      render :new
    end
  end

  def edit
    @tags = []
    @post.tags.each do |tag|
      @tags << tag.tag_name
    end

    @images_count = @post.images.length.to_i

    @category_parent_array = ['---', '大型犬', '中型犬', '小型犬']
    @category_child_array = [{ id: '---', name: '---' }]
    @parent = Category.find_by(name: @post.parent_category)
    @parent&.children&.each do |child|
      @category_child_array += [{ id: child.id, name: child.name }]
    end
  end

  def update
    if @post.update(post_params)
      @post.tags.clear
      tag_list = tag_params[:tag_names].gsub(/[[:space:]]/, '').split(',').uniq
      @post.save_tags(tag_list)
      delete_images if params[:post][:images_blob_ids]
      flash[:notice] = "「#{@post.title}」を更新しました"
      redirect_to @post
    else
      @images_count = @post.images.length.to_i
      render :edit
    end
  end

  def show
    @comment = Comment.new(post_id: @post.id)
    @comments = @post.comments.includes(user: { image_attachment: :blob })
    @user_posts = Post.user_posts_search(@post.user.id, @post.id).limit(3)
    @new_posts = Post.new_posts_search(@post.id, @post.user.id).limit(3)
  end

  def destroy
    if @post.user.id == current_user.id
      @post.destroy
      redirect_to posts_path, flash: { alert: "「#{@post.title}」を削除しました" }
    else
      redirect_to posts_path, flash: { alert: '記事を削除できませんでした' }
    end
  end

  def set_category_children
    @category_children = Category.find_by(
      name: params[:parent_name].to_s,
      ancestry: nil
    ).children
  end

  private

  def post_params
    params.require(:post).permit(
      :title,
      :body,
      :parent_category,
      :child_category,
      images: []
    ).merge(user_id: current_user.id)
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

  def tag_params
    params.require(:post).permit(:tag_names)
  end
end
