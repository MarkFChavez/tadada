class HomeController < ApplicationController
  def index
    @discussions = discussions

    if filters && filters.present?
      @discussions = Discussion.search_by_category(filters[:search])
    end
  end

  private

  def filters
    params.permit(:search)
  end

  def discussions
    Discussion.all
  end
end
