require 'spec_helper'

feature 'Home Page', %q{
	As an unregistered user
	I want to see the home/landing page
} do
  background do
    # Nothing to do here
  end
  scenario "Home page" do
    visit "/"
    page.should have_link('Sign In')
    page.should have_selector('title', :content => "Loccasions")
    page.should have_content('What is Loccasions?')
  end
end

feature 'Sign In', %q{
	As an administrator
	I want to sign in to Loccasions
} do
  background do
    visit "/"
  end
  scenario "Click Sign In" do
    click_link "Sign In"
    page.should have_selector("title", :text => "Loccasions: Sign In")
    page.should have_selector('form')
  end
  scenario "Successful Sign In" do
    click_sign_in
    FactoryGirl.create(:user)
    fill_in 'Email', :with => 'testy@test.com'
    fill_in 'Password', :with => 'password'
    click_on('Sign in')
    current_path.should == user_root_path
  end
  scenario "Unsuccessful Sign In" do
    click_sign_in
    fill_in 'Name', :with => "BadUser"
    fill_in 'Email', :with => 'hacker@getyou.com'
    fill_in 'Password', :with => 'badpassword'
    click_on 'Sign in'
    current_path.should == user_session_path
    page.should have_content("Invalid email or password")
  end
end
