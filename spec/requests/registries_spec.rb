require 'spec_helper'

describe 'Creating a Registry' do
  
  before(:each) do
    @user = FactoryGirl.create(:user)
    visit root_path
    click_link "Log In"
    fill_in "Email", :with => @user.email
    fill_in "Password", :with => @user.password
    click_button "Log In"
  end  
  
  it "creates a new registry" do
    visit(root_path)
    #save_and_open_page
    click_link "Create a registry"
    fill_in "Registry Name" , :with =>"A Small Wishlist"
    fill_in "Description", :with => "this is intended to start small, but later it will be massive!"
    click_button "Create"
    page.should have_content("Registry created successfully!")
    page.should have_content("A Small Wishlist")
  end
  
  it "does not allow a blank registry name" do
    visit(root_path)
    #save_and_open_page
    click_link "Create a registry"
    fill_in "Registry Name" , :with =>""
    click_button "Create"
    page.should_not have_content("Registry created successfully!")
    page.should have_content("Name can't be blank")
  end

end


describe "Registries when there are more than 1 user viewing them" do

  before(:all) do
    @registry = FactoryGirl.create(:registry)
    @other_user = FactoryGirl.create(:user)
    visit root_path
    click_link "Log In"
    fill_in "Email", :with => @other_user.email
    fill_in "Password", :with => @other_user.password
    click_button "Log In"
  end
  
  it "works" do
  
  end
  
  
end