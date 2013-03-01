require 'spec_helper'
require 'support/application_support'
require 'pp'

describe "Registry items" do
  
  before(:all) do
    populate_attr_names
  end
  
  before(:each) do
    @user = FactoryGirl.create(:user)
    @registry = FactoryGirl.create(:registry, :owner_id => @user.id)
    log_in_with_user(@user)
  end
  
  it "can be added to an existing registry" do
    #pp "user is #{@user.firstname}"
    #pp "registry is #{@registry.name}"
    visit root_path
    page.should have_content("Create a registry")
    click_link "View my registries"
    page.should have_content("#{@registry.name}")
    click_link "#{@registry.name}"
    click_link "Add an item to my registry"
    #save_and_open_page
    
  end
  
  it "can be created with an attribute" do
    visit new_registry_registry_item_path(@registry)
    click_link "Return to Registry"
    click_link "Add an item to my registry"
    page.should have_content("Add a new item to your #{@registry.name}")
    reg_item = FactoryGirl.attributes_for(:registry_item)
    #FactoryGirl.attributes_for()
    fill_in "Name", :with => reg_item[:name]
    fill_in "Description", :with => reg_item[:description]
    select "Attribute Number 1", :from => "registry_item_item_attr_vals_attributes_0_attr_name_id"
    fill_in "registry_item_item_attr_vals_attributes_0_raw_value", :with => "A String Value"
    click_button "Add"
    page.should have_content("#{reg_item[:description]}")
    page.should have_content("Attribute Number 1")
    page.should have_content("A String Value")
    #save_and_open_page
  end
end