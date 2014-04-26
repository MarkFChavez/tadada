require 'spec_helper'

feature "Signing out" do
  describe "on the dashboard page" do
    let!(:user) { create(:user) }
  
    before do
      sign_in user
    end

    it 'redirects me to the sign in page' do
      click_on 'Sign out'
      expect(page).to have_content 'Sign in' 
    end
  end
end
