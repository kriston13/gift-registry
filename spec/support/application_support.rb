require 'spec_helper'


# def create_logged_in_user
#   @user = FactoryGirl.create(:user)
# end

def log_in_with_user(user)
  visit root_path
  click_link "Log In"
  # pp "================================"
  # pp "email is: #{user.email}"
  # pp "password is: #{user.password}"
  fill_in "Email", :with => user.email
  fill_in "Password", :with => user.password
  #save_and_open_page
  click_button "Log In"
  page.should have_content(user.firstname)
end 

def create_registry_with_user
  create_logged_in_user
  FactoryGirl.create(:registry)
end

def populate_registry_with_items
  @registry = FactoryGirl.create(:registry)
  
end

def populate_attr_names
  @type_list = ["STRING","FLOAT","DATETIME","BOOLEAN","INTEGER"]
  @type_list.each do |thing| 
    FactoryGirl.create(:attr, :description => "A #{thing.humanize} Attribute",  :value_type => thing)
  end
  FactoryGirl.create(:price_attr, :description => "A Price Attribute")
end
  