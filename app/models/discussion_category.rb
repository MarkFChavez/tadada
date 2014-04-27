class DiscussionCategory < ActiveRecord::Base
  belongs_to :discussion
  belongs_to :category
end
