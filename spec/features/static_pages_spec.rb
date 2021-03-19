# spec/features/static_pages_spec.rb

require 'rails_helper'

describe "Static pages" do
  subject { page }

  let(:base_title) { "Chatter" }
  let(:footer_text) {
    "©2021, Imperial Sword Creations All rights reserved." }
  
  describe "Home page" do
    before(:each) { visit root_path }
    
    it { should have_selector('h1', text: "Welcome to Chatter!") }
    it { should have_selector('p', text: "#{footer_text}") }     
    it { should have_title(full_title('')) }
    it { should have_no_title('| Home') }
    it { should have_link('Home') }
    it { should have_link('Help') }
    it { should have_link('Sign In') }
    it { should have_link('About') }
    it { should have_link('Contact') }
  end

  describe "Help page" do
    before(:each) { visit help_path }

    it { should have_selector('h1', text: 'Help') }
    it { should have_selector('p', :text => "#{footer_text}") }
    it { should have_title(full_title('Help')) }
    it { should have_link('Home') }
    it { should have_link('Help') }
    it { should have_link('Sign In') }
    it { should have_link('About') }
    it { should have_link('Contact') }
  end

  describe "About page" do
    before(:each) { visit about_path }

    it { should have_selector('h1', :text => 'About') }
    it { should have_selector('p', :text => "#{footer_text}") }
    it { should have_title(full_title('About')) }
    it { should have_link('Home') }
    it { should have_link('Help') }
    it { should have_link('Sign In') }
    it { should have_link('About') }
    it { should have_link('Contact') }
  end

  describe "Contact page" do
    before(:each) { visit contact_path }

    it { should have_selector('h1', text: 'Contact Us') }
    it { should have_selector('p', text: "#{footer_text}") }
    it { should have_title(full_title("Contact Us")) }
    it { should have_link('Home') }
    it { should have_link('Help') }
    it { should have_link('Sign In') }
    it { should have_link('About') }
    it { should have_link('Contact') }
  end

  describe "Sign In page" do
    before(:each) { visit signIn_path }

    it { should have_selector('h1', text: 'Sign In') }
    it { should have_selector('p', text: "#{footer_text}") }
    it { should have_title(full_title("Sign In")) }
    it { should have_link('Home') }
    it { should have_link('Help') }
    it { should have_link('Sign In') }
    it { should have_link('About') }
    it { should have_link('Contact') }
  end
end
