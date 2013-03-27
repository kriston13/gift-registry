require 'spec_helper'
require 'support/application_support'

describe 'Creating a Registry' do
  
  before(:each) do
    #@user = create_logged_in_user
    @user = FactoryGirl.create(:user)
    log_in_with_user(@user)
  end  
  
  it "will result in a new registry" do
    visit(root_path)
    #save_and_open_page
    click_link "Create a registry"
    fill_in "Registry Name" , :with =>"A Small Wishlist"
    fill_in "Description", :with => "this is intended to start small, but later it will be massive!"
    click_button "Create"
    page.should have_content("Registry created successfully!")
    page.should have_content("A Small Wishlist")
  end
  
  it "will not allow a blank registry name" do
    visit(root_path)
    #save_and_open_page
    click_link "Create a registry"
    fill_in "Registry Name" , :with =>""
    click_button "Create"
    page.should_not have_content("Registry created successfully!")
    page.should have_content("Name can't be blank")
  end

end


describe "Authentication will be required to" do

  before(:each) do
    @registry = FactoryGirl.create(:registry)
    #@other_user = FactoryGirl.create(:user)
  end
  
  it "create a registry" do
    visit(new_registry_path)
    current_path.should == login_path
  end
  
  it "delete a registry" do
    pending("need to set up a way to delete registries first")
  end
  
  it "edit a registry" do
    pending("need to set up a way to edit registries first")
  end
  
end

describe "Registries with multiple users" do

  before(:each) do
    @registry = FactoryGirl.create(:registry)
    @other_user = FactoryGirl.create(:user)
    visit root_path
    click_link "Log In"
    fill_in "Email", :with => @other_user.email
    fill_in "Password", :with => @other_user.password
    click_button "Log In"
  end
  
  it "will only allow the owner to add registry item links" do
    visit(registry_path(@registry))
    page.should_not have_content("Add an item to my registry")
    find("#login_logout").click_link "Logout"
    page.should have_content("You've been logged out")
    click_link "Log In"
    fill_in "Email", :with =>@registry.owner.email
    fill_in "Password", :with =>@registry.owner.password
    click_button "Log In"
    click_link "View my registries"
    page.should have_content("Add a new registry")
    page.should have_content(@registry.name)
  end
  
  
end