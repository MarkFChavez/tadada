class HomeController < ApplicationController
  def index
    @discussions = discussions
  end

  private

  def discussions
    Discussion.all
  end
end
