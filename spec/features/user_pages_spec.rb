require 'rails_helper'
 
RSpec.describe "UserPages" do
  subject { page }

  describe "home page" do
    before { visit users_path }

    it { should have_selector('h1', text: 'Active Users') }
    it { should have_title(full_title('Users')) }
  end

  describe "signup page" do
    before { visit signup_path }

    it { should have_selector('h1', text: 'Sign up') }
    it { should have_title(full_title('Sign Up')) }
  end

  describe "profile page" do
    let(:user) { FactoryBot.create(:user) }
    before { visit user_path(user) }

    it { should have_selector('h1', text: user.username) }
    it { should have_title(user.username) }
  end

 # describe "creating invalid users" do
 #   before { visit signup_path }
 #   # we don't have validation yet
 # end
 #
 # describe "creating valid users" do
 #   before { visit signup_path }
 # 
 #   fill_in 'Name', with: 'Testy Tester'
 #   fill_in 'Email', with: 'test@testytester.com'
 #   fill_in 'UserId', with: 'TestyT123'
 # 
 #   click_on 'Submit'
 # end
end
