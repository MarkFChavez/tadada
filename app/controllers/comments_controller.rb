class CommentsController < ApplicationController
  def create
    @comment = discussion.comments.build comment_params
    @comment.user = current_user

    if @comment.save
      redirect_to discussion, notice: I18n.t('comments.create_success')
    else

    end
  end

  private

  def comment_params
    params.require(:comment).
      permit(:body)
  end

  def discussion
    Discussion.find(params[:discussion_id])
  end
end
