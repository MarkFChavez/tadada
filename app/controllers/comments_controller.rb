class CommentsController < ApplicationController
  def create
    @comment = build_comment

    if @comment.save
      redirect_to discussion, notice: I18n.t('comments.create_success')
    else
      redirect_to discussion, alert: I18n.t('comments.create_error')
    end
  end

  private

  def build_comment
    comment = discussion.comments.build comment_params
    comment.user = current_user

    comment
  end

  def comment_params
    params.require(:comment).
      permit(:body)
  end

  def discussion
    Discussion.find(params[:discussion_id])
  end
end
