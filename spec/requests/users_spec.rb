require 'spec_helper'

describe "Users" do
  
  it "creates a new user" do
    visit root_path
    click_link "Sign Up"
    attrs = FactoryGirl.attributes_for(:user)
    fill_in "Email", :with => attrs[:email]
    fill_in "First Name", :with => attrs[:firstname]
    fill_in "user_password", :with => attrs[:password]
    fill_in "user_password_confirmation", :with => attrs[:password]
    click_button "Sign Up"
    #save_and_open_page
    page.should have_content("You're now registered")
    page.should have_content(attrs[:firstname])
  end
  
  it "allows users to login" do
    user = FactoryGirl.create(:user)
    visit root_path
    click_link "Log In"
    fill_in "Email", :with => user.email
    fill_in "Password", :with => user.password
    click_button "Log In"
    page.should have_content(user.firstname)
    page.should have_content("Logout")
    find("#login_logout").click_link "Logout"
    page.should have_content("You've been logged out")
  end
  
  it "validates passwords match" do
    visit root_path
    click_link "Sign Up"
    attrs = FactoryGirl.attributes_for(:user)
    fill_in "Email", :with => attrs[:email]
    fill_in "First Name", :with => attrs[:firstname]
    fill_in "user_password", :with => attrs[:password]
    fill_in "user_password_confirmation", :with => "password-not-the-same"
    click_button "Sign Up"
    #save_and_open_page
    page.should have_content("Password doesn't match confirmation")
  end
  
  
end
