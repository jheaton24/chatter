# spec/features/static_pages_spec.rb

require 'rails_helper'

describe "Static pages" do

  let(:base_title) {"Chatter"}
  let(:footer_text) {
    "© 2021, Imperial Sword All rights reserved."}
  
  describe "Home page" do
    it "should have the content 'Sample App'" do
      visit '/static_pages/home'
      expect(page).to have_selector('h1', :text => 'Sample App')
      expect(page).to have_selector('h6', :text => "#{footer_text}")
    end

    it "should have the base title" do
      visit '/static_pages/home'
      expect(page).to have_title("#{base_title}")
    end

    it "should have a custom page title" do
      visit '/static_pages/home'
      expect(page).to have_no_title('| Home')
    end
  end

  describe "Help page" do
    it "should have the content 'Help'" do
      visit "/static_pages/help"
      expect(page).to have_selector('h1', :text => 'Help')
      expect(page).to have_selector('h6', :text => "#{footer_text}")
    end

    it "should have the title 'Help'" do
      visit '/static_pages/help'
      expect(page).to have_title("#{base_title} | Help")
    end
  end

  describe "About page" do
    it "should have the content 'About'" do
      visit "/static_pages/about"
      expect(page).to have_selector('h1', :text => 'About')
      expect(page).to have_selector('h6', :text => "#{footer_text}")
    end

    it "should have the title 'About'" do
      visit '/static_pages/about'
      expect(page).to have_title("#{base_title} | About")
    end
  end
end
