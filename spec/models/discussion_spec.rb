require 'spec_helper'

describe Discussion do
  it { should belong_to :user }
  it { should validate_presence_of :title }
  it { should validate_presence_of :body }

  it { should have_many :comments }
  it { should have_many(:discussion_categories).dependent(:destroy) }
  it { should have_many(:categories).through(:discussion_categories) }

  describe "Scopes" do
    let!(:ruby) { create(:category, name: 'ruby') }
    let!(:rails) { create(:category, name: 'rails') }
    let!(:discussion1) { create(:discussion, categories: [ruby]) }
    let!(:discussion2) { create(:discussion, categories: [rails]) }

    it ".search_by_category" do
      discussions = Discussion.search_by_category 'ruby'

      expect(discussions).to eq [discussion1]
    end
  end
end
