class DiscussionsController < ApplicationController
  def show
    @discussion = Discussion.find(params[:id]) 
    @new_comment = new_comment
  end

  def new
    @new_discussion = new_discussion
  end

  def create
    discussion = current_user.discussions.build discussion_params

    if discussion.save
      redirect_to root_path, notice: I18n.t('discussions.create_success')
    else
      redirect_to new_discussion_path, alert: I18n.t('discussions.create_error')
    end
  end

  private

  def new_discussion
    Discussion.new
  end

  def new_comment
    Comment.new
  end

  def discussion_params
    params.require(:discussion).
      permit(:title, :body)
  end
end
