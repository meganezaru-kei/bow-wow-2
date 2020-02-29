class UsersController < ApplicationController
  before_action :set_target_user

  def show
    @posts = Post.with_attached_images.recent.user(@user.id).page(params[:page])
  end

  def edit; end

  def update
    if @user.update(user_params)
      flash[:notice] = "#{@user.name}さんのユーザー情報を更新しました"
      redirect_to @user
    else
      render :edit
    end
  end

  private

  def set_target_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :image)
  end
end
