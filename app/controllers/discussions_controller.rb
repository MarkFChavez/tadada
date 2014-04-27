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
    build_categories discussion

    if discussion.save
      redirect_to root_path, notice: I18n.t('discussions.create_success')
    else
      redirect_to new_discussion_path, alert: I18n.t('discussions.create_error')
    end
  end

  private

  def build_categories discussion
    if categories_params and categories_params[:name].present?
      categories = categories_params[:name].split ","

      categories.each do |category|
        cat = Category.find_or_create_by(name: category)
        discussion.categories << cat
      end
    end
  end

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

  def categories_params
    params.require(:categories).
      permit(:name)
  end
end
