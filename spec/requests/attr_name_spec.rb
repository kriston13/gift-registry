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
  
  
  
end