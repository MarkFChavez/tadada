require 'spec_helper'

describe Discussion do
  it { should belong_to :user }
  it { should validate_presence_of :title }
  it { should validate_presence_of :body }

  it { should have_many :comments }
  it { should have_many(:discussion_categories).dependent(:destroy) }
  it { should have_many(:categories).through(:discussion_categories) }
end
