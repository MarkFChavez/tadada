require "spec_helper"

feature "Signing in" do
  describe "with valid credentials" do
    let!(:user) { create(:user) }

    before do
      sign_in user
    end

    it "shows me the dashboard page" do
      expect(page).to have_content 'Dashboard page'
    end

    it "enables me to logout" do
      expect(page).to have_content 'Sign out'
      expect(page).to_not have_content 'Sign in'
    end
  end

  describe "with invalid credentials" do
    let!(:invalid_user) { build(:user) }

    before do
      sign_in invalid_user
    end

    it "does not show me the dashboard page" do
      expect(page).to_not have_content 'Dashboard page'
      expect(page).to have_content 'Invalid email or password'
    end

    it "enables me to sign in again" do
      expect(page).to have_content 'Sign in'
    end
  end
end
