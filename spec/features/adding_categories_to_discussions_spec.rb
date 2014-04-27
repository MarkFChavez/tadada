require "spec_helper"

feature "Adding categories" do
  let!(:user) { create(:user) }

  describe "while creating a discussion" do
    before do
      sign_in user
      click_on 'Create a Discussion'
    end

    it "adds those categories for that discussion" do
      fill_in 'Title', with: 'Yet another discussion'
      fill_in 'Body', with: 'This discussion will have a lot of categories'
      fill_in 'Categories', with: 'ruby, rails, programming, computer science'
      click_on 'Save'
    
      within('.discussion-categories') do
        expect(page).to have_css '.category', text: 'ruby'
        expect(page).to have_css '.category', text: 'rails'
        expect(page).to have_css '.category', text: 'programming'
        expect(page).to have_css '.category', text: 'computer science'
      end
    end
  end
end
