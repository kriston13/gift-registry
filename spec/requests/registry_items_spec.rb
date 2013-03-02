require 'spec_helper'
require 'support/application_support'
require 'pp'

describe "Registry items" do
  
  before(:all) do
    #populate_attr_names
  end
  
  before(:each) do
    populate_attr_names
    @user = FactoryGirl.create(:user)
    @registry = FactoryGirl.create(:registry, :owner_id => @user.id)
    #log_in_with_user(@user)
  end
  
  it "can be added to an existing registry" do
    log_in_with_user(@user)
    visit root_path
    page.should have_content("Create a registry")
    click_link "View my registries"
    page.should have_content("#{@registry.name}")
    click_link "#{@registry.name}"
    click_link "Add an item to my registry"
    
  end
  
  it "can be created with an attribute" do
    log_in_with_user(@user)
    visit new_registry_registry_item_path(@registry)
    click_link "Return to Registry"
    click_link "Add an item to my registry"
    page.should have_content("Add a new item to your #{@registry.name}")
    reg_item = FactoryGirl.attributes_for(:registry_item)
    fill_in "Name", :with => reg_item[:name]
    fill_in "Description", :with => reg_item[:description]
    select "A Integer Attribute", :from => "registry_item_item_attr_vals_attributes_0_attr_name_id"
    fill_in "registry_item_item_attr_vals_attributes_0_raw_value", :with => "59"
    click_button "Create Registry item"
    page.should have_content("#{reg_item[:description]}")
    page.should have_content("A Integer Attribute")
    page.should have_content("59")
    #save_and_open_page
  end
  
  it "can be edited to change details", :js => true do
    log_in_with_user(@user)
    item1 = FactoryGirl.create(:registry_item, :registry_id => @registry.id)
    an_string = AttrName.find_by_value_type("STRING")
    FactoryGirl.create(:item_attr_val, :registry_item_id => item1.id, :attr_name_id =>  an_string.id)
    
    visit registry_path(@registry)
    page.should have_content("#{@registry.name}")
    page.should have_content("#{@registry.registry_items.first.name}")
    page.should have_content("#{an_string.description}")
    
    within("div#registry_item_#{@registry.registry_items.first.id}") do
      click_link "edit"
    end
    
    page.should have_content("Edit this item")
    within("form") do
      fill_in "Name", :with => "An update item name"
      within("fieldset") do
        select "A Integer Attribute",:from => "registry_item_item_attr_vals_attributes_0_attr_name_id"
        fill_in "registry_item_item_attr_vals_attributes_0_raw_value", :with => "59.99"
        click_link "Add another attribute"
        
        data_id = first('a.add_fields')['data-id']
        find(:xpath, '//select/option[@value=\'\']/..').select "A String Attribute"
        
        text_field_id = find(:xpath, '//fieldset/input[@type=\'text\'][2][@id]')
        fill_in "#{text_field_id[:id]}", :with =>"An added attribute"
      end
    end
    click_button "Update Registry item"
    page.should have_content("Item has been updated")
    page.should have_content("A Integer Attribute")
    page.should have_content("59")
    page.should have_content("A String Attribute")
    page.should have_content("An added attribute")
    
  end
  
end