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

  describe "signup" do
    before { visit signup_path }
    let(:submit) { "Create account" }

    describe "with invalid info" do
      it "should not create a user" do
        expect { click_button submit }.not_to change(User, :count)
      end
    end

    describe "with valid info" do
      before do
        fill_in "Name", with: "Example User"
        fill_in "Email", with: "user@example.com"
        fill_in "Username", with: "example_user_1017"
        fill_in "Password", with: 'foobar'
        fill_in "Confirmation", with: 'foobar'
      end

      it "should create a user" do
        expect { click_button submit }.to change(User, :count).by(1)
      end
    end
  end

  describe "profile page" do
    let(:user) { FactoryBot.create(:user) }
    before { visit user_path(user) }

    it { should have_selector('h1', text: user.username) }
    it { should have_title(user.username) }
  end

end
