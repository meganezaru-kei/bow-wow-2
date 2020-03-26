class CommentsController < ApplicationController
  before_action :set_target_comment, only: %i[destroy]
  
  def create
    comment = Comment.new(comment_params)
    if comment.save
      flash[:notice] = 'コメントを投稿しました'
      redirect_to comment.post
    else
      redirect_to post_path(comment.post.id), flash: {
        comment: comment,
        error_messages: comment.errors.full_messages
      }
    end
  end

  def destroy
    if @comment.user_id == current_user.id
      @comment.destroy
      redirect_to @comment.post, flash: { notice: 'コメントが削除されました' }
    else
      redirect_to @comment.post, flash: { alert: 'コメントの削除に失敗しました' }
    end
  end

  private

  def comment_params
    params.require(:comment).permit(
      :post_id,
      :comment
    ).merge(user_id: current_user.id)
  end

  def set_target_comment
    @comment = Comment.find(params[:id])
  end
end
