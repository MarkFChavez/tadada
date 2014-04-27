class Category < ActiveRecord::Base
  has_many :discussion_categories, dependent: :destroy
  has_many :discussions, through: :discussion_categories
end
