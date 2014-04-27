class Discussion < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :discussion_categories, dependent: :destroy
  has_many :categories, through: :discussion_categories

  validates :title, :body, presence: true
end
