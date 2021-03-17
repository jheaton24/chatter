# spec/features/static_pages_spec.rb

require 'rails_helper'
#require 'spec_helper'

describe "Static pages" do

  describe "Home page" do
    it "should have the content 'Sample App'" do
      visit '/static_pages/home'
      expect(page).to have_selector('h1', :text => 'Sample App')
    end

    it "should have the title 'Home'" do
      visit '/static_pages/home'
      expect(page).to have_title('| Home')
    end
  end

  describe "Help page" do
    it "should have the content 'Help'" do
      visit "/static_pages/help"
      expect(page).to have_selector('h1', :text => 'Help')
    end

    it "should have the title 'Help'" do
      visit '/static_pages/help'
      expect(page).to have_title('| Help')
    end
  end

  describe "About page" do
    it "should have the content 'About'" do
      visit "/static_pages/about"
      expect(page).to have_selector('h1', :text => 'About')
    end

    it "should have the title 'About'" do
      visit '/static_pages/about'
      expect(page).to have_title('| About')
    end
  end
end
