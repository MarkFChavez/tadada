require "spec_helper"

feature "Creating a discussion" do
  let!(:user) { create(:user) }
  let!(:inactive_user) { create(:user) }

  it "shows it on the dashboard page" do
    sign_in user
    click_on 'Create a Discussion'

    fill_in 'Title', with: 'This is a title for my discussion'
    fill_in 'Body', with: 'This is my body for this discussion'
    click_on 'Save'

    expect(page).to have_content 'New discussion created'

    within('.discussions') do
      expect(page).to have_css '.title', text: 'This is a title for my discussion'
      expect(page).to have_css '.body', text: 'This is my body for this discussion'
      expect(page).to have_css '.created_by', text: user.email
    end
  end

  context 'invalid scenarios' do
    before do
      sign_in user
      click_on 'Create a Discussion'
    end

    it "requires title to be filled up" do
      fill_in 'Title', with: ''
      fill_in 'Body', with: 'This is my body for this discussion'
      click_on 'Save'

      expect(page).to have_content 'Discussion not saved'
    end

    it "requires body to be filled up" do
      fill_in 'Title', with: 'This has content'
      fill_in 'Body', with: ''
      click_on 'Save'

      expect(page).to have_content 'Discussion not saved'
    end
  end

  describe "list of discussions " do
    let!(:discussion1) { create(:discussion, user: user) }
    let!(:discussion2) { create(:discussion, user: user) } 
    let!(:discussion3) { create(:discussion, user: inactive_user) }

    before do
      sign_in user
    end

    it "shows all discussions" do
      within('.discussions') do
        expect(page).to have_content discussion1.title
        expect(page).to have_content discussion2.title
        expect(page).to have_content discussion3.title
      end
    end

    it "shows the counts of discussions created" do
      expect(page).to have_css '.discussions-count', text: '3 discussions'
    end
  end
end
