require 'spec_helper'

describe 'Viewing all attributes' do
  
  before(:all) do
    @type_list = ["STRING","FLOAT","DATETIME","BOOLEAN","INTEGER"]
    @type_list.each do |thing| 
      FactoryGirl.create(:attr, :value_type => thing)
    end
    #@attr_1 = FactoryGirl.create(:attr)
  end
  
  it "will display all known attributes" do
    visit(root_path)
    click_link "Manage item attributes"
    page.should have_content("Item Attributes")
    page.should have_content("Add a new item attribute")
    page.should have_content("Attribute Number 1 - STRING")
  end
  
  it "will add a new item attribute" do
    visit(attr_names_path)
    click_link "Add a new item attribute"
    page.should have_content("Create a new attribute")
    fill_in "Description", :with => "Price"
    #save_and_open_page
    select('Float', :from => 'attr_name_value_type')
    #fill_in "Type", :with => "FLOAT"
    #page.should have_css("#")
    click_button "Create"
    page.should have_content("Attribute Number 1 - STRING")
    page.should have_content("Price - FLOAT")
    page.should have_content("Successfully created a new attribute") 
    save_and_open_page
  end
  
  
end