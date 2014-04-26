class HomeController < ApplicationController
  def index
    @discussions = discussions
  end

  private

  def discussions
    current_user.discussions
  end
end
