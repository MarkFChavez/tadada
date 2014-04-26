require "spec_helper"

feature "Creating comments" do
  let!(:user) { create(:user) } 
  let!(:discussion1) { create(:discussion, title: 'Discussion 1', user: user) }
  let!(:discussion2) { create(:discussion, title: 'Discussion 2', user: user) }

  describe "on the discussion page" do
    before do
      sign_in user
    end

    it "lists it on the discussons page" do
      within('.discussions') do
        click_on discussion1.title
      end

      expect(page).to have_css '.discussion-title', text: discussion1.title
      expect(page).to have_css '.discussion-body', text: discussion1.body
      expect(page).to have_css '.discussion-created_by', text: discussion1.user.email

      within('.new-comment') do
        fill_in 'comment_body', with: 'Hey, this is a nice article you got!'
        click_on 'Add comment'
      end

      expect(page).to have_content 'Great! Comment successfully added.'

      within('.comments') do
        expect(page).to have_css '.comment-user', text: user.email
        expect(page).to have_css '.comment-body', text: 'Hey, this is a nice article you got!'
      end
    end

    describe "invalid creation of comments" do
      it "shows an error message" do
        within('.discussions') do
          click_on discussion1.title
        end

        within('.new-comment') do
          fill_in 'comment_body', with: ''
          click_on 'Add comment'
        end

        expect(page).to have_content 'Sorry, the server got nothing!'
      end
    end

    describe "comments count" do
      before do
        create(:comment, discussion: discussion1)
        create(:comment, discussion: discussion1)
        create(:comment, discussion: discussion2)
      end

      it "shows the count of comments on the discussions list" do
        within('.discussions') do
          click_on discussion1.title
        end

        expect(page).to have_css '.comments-count', text: '2 comments'

        visit root_path
        
        within('.discussions') do
          click_on discussion2.title
        end

        expect(page).to have_css '.comments-count', text: '1 comment'
      end
    end
  end
end
