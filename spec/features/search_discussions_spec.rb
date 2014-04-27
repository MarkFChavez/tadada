require "spec_helper"

feature "Searching discussions" do
  let!(:user) { create(:user) }
  let!(:ruby) { create(:category, name: "ruby") }
  let!(:rails) { create(:category, name: "rails") }
  let!(:discussion1) { create(:discussion, categories: [ruby, rails]) }
  let!(:discussion2) { create(:discussion, categories: [ruby]) }
  let!(:discussion3) { create(:discussion, categories: [rails]) }

  describe "by category" do
    before do
      sign_in user
    end

    context "searching for ruby" do
      it "shows the discussions for that category" do
        fill_in 'Search', with: 'ruby' 
        click_on 'Search'

        within('.discussions') do
          expect(page).to have_content discussion1.title
          expect(page).to have_content discussion2.title
          expect(page).to_not have_content discussion3.title
        end
      end
    end

    context "searching for rails" do
      it "shows the discussions for that category" do
        fill_in 'Search', with: 'rails' 
        click_on 'Search'

        within('.discussions') do
          expect(page).to have_content discussion1.title
          expect(page).to_not have_content discussion2.title
          expect(page).to have_content discussion3.title
        end
      end
    end
  end
end
