require 'spec_helper'

describe 'Attribute functionality' do
  
  before(:all) do
    populate_attr_names
    #@attr_1 = FactoryGirl.create(:attr)
  end
  
  it "will display all known attributes" do
    visit(root_path)
    click_link "Manage item attributes"
    page.should have_content("Item Attributes")
    page.should have_content("Add a new item attribute")
    page.should have_content("Attribute Number 1 - STRING")
  end
  
  it "will be able to add a new item attribute" do
    visit(attr_names_path)
    click_link "Add a new item attribute"
    page.should have_content("Create a new attribute")
    fill_in "Description", :with => "Price"
    select('Float', :from => 'attr_name_value_type')
    click_button "Create"
    page.should have_content("Attribute Number 1 - STRING")
    page.should have_content("Price - FLOAT")
    page.should have_content("Successfully created a new attribute") 
    #save_and_open_page
  end
  
  it "should let me edit existing item attributes" do
    visit(attr_names_path)
    page.should have_content("Attribute Number 1 - STRING")
    #save_and_open_page
    find("a#edit_attr_name_1").click
    page.should have_content("Edit")
    fill_in "attr_name_description", :with => "RRP"
    select('Float', :from => 'attr_name_value_type')
    click_button "Update"
    page.should have_content("RRP - FLOAT")
    #save_and_open_page
    page.should have_content("Attribute Number 3 - DATETIME")
    page.should have_content("Attribute has been updated")
  end
  
  it "should let me delete existing item attributes" do
    visit(attr_names_path)
    page.should have_content("Attribute Number 4 - BOOLEAN")
    #save_and_open_page
    find("a#delete_attr_name_4").click
    page.should have_content("Attribute has been deleted")
  end
  
end