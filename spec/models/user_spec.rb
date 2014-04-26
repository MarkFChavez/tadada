require 'spec_helper'

describe User do
  it { should have_many(:discussions).dependent(:destroy) }

  describe "#discuss" do
    before do
      @user = create(:user)
      @discussion = { title: build(:discussion).title, body: build(:discussion).body }
    end

    it "creates a new dicussion" do
      expect { @user.discuss! @discussion }.to change(Discussion, :count).by 1
    end

    it "associates the discussion to the user" do
      @user.discuss! @discussion
      expect(Discussion.last.user).to eq @user
    end
  end
end
