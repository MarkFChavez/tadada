class DiscussionsController < ApplicationController
  def new
    @new_discussion = new_discussion
  end

  def create
    if current_user.discuss discussion_params
      redirect_to root_path, notice: I18n.t('discussions.create_success')
    else
      redirect_to new_discussion_path, alert: I18n.t('discussions.create_error')
    end
  end

  private

  def new_discussion
    Discussion.new
  end

  def discussion_params
    params.require(:discussion).
      permit(:title, :body)
  end
end
