# spec/features/static_pages_spec.rb

require 'rails_helper'

describe "Static pages" do

  let(:base_title) {"Chatter"}
  let(:footer_text) {
    "©2021, Imperial Sword Creations All rights reserved."}
  
  describe "Home page" do
    it "should have the content 'Chatter'" do
      visit root_path 
      expect(page).to have_selector('h1', text: "Welcome to Chatter!") 
      expect(page).to have_selector('p', :text => "#{footer_text}")
    end

    it "should have the base title" do
      visit root_path
      expect(page).to have_title("#{base_title}")
    end

    it "should have a custom page title" do
      visit root_path 
      expect(page).to have_no_title('| Home')
    end

    it "should have working links" do
      visit root_path
      expect(page).to have_link('Home')
      expect(page).to have_link('Help')
      expect(page).to have_link('Sign In')
      expect(page).to have_link('About')
      expect(page).to have_link('Contact')
    end
  end

  describe "Help page" do
    it "should have the content 'Help'" do
      visit help_path
      expect(page).to have_selector('h1', text: 'Help')
      expect(page).to have_selector('p', :text => "#{footer_text}")
    end

    it "should have the title 'Help'" do
      visit help_path
      expect(page).to have_title("#{base_title} | Help")
    end
  end

  describe "About page" do
    it "should have the content 'About'" do
      visit about_path
      expect(page).to have_selector('h1', :text => 'About')
      expect(page).to have_selector('p', :text => "#{footer_text}")
    end

    it "should have the title 'About'" do
      visit about_path
      expect(page).to have_title("#{base_title} | About")
    end
  end

  describe "Contact page" do
    it "should have the content 'Contact Us'" do
      visit contact_path
      expect(page).to have_selector('h1', text: 'Contact Us')
      expect(page).to have_selector('p', text: "#{footer_text}")
    end

    it "should have the title 'Contact Us'" do
      visit contact_path
      expect(page).to have_title("#{base_title} | Contact Us")
    end
  end

  describe "Sign In page" do
    it "should have the content 'Sign In'" do
      visit signIn_path
      expect(page).to have_selector('h1', text: 'Sign In')
      expect(page).to have_selector('p', text: "#{footer_text}")
    end

    it "should have the title 'Sign In'" do
      visit signIn_path
      expect(page).to have_title("#{base_title} | Sign In")
    end
  end
end
