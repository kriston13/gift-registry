When /^"(.*?)" signs up$/ do |name|
  visit('/signup')
  within("#new_user") do
    fill_in 'Email', :with => 'pingpong@mailinator.com'
    fill_in 'First Name', :with => name
    fill_in 'Last Name', :with => 'pong'
    fill_in 'user_password', :with => 'passw0rd'
    fill_in 'user_password_confirmation', :with => 'passw0rd'
  end
  click_button 'Sign Up'
end


Then /^I see "(.*?)"$/ do |text|
  page.has_content?(text)
end


When /^"(.*?)" signs up without matched passwords$/ do |name|
  visit('/signup')
  within("#new_user") do
    fill_in 'Email', :with => 'pingpong@mailinator.com'
    fill_in 'First Name', :with => name
    fill_in 'Last Name', :with => 'pong'
    fill_in 'user_password', :with => 'passw0rd'
    fill_in 'user_password_confirmation', :with => 'differentPassw0rd'
  end
  click_button 'Sign Up'
end

When /^"(.*?)" signs up without a first name$/ do |name|
  visit('/signup')
  within("#new_user") do
    fill_in 'Email', :with => 'pingpong@mailinator.com'
    fill_in 'First Name', :with => ''
    fill_in 'Last Name', :with => 'pong'
    fill_in 'user_password', :with => 'passw0rd'
    fill_in 'user_password_confirmation', :with => 'differentPassw0rd'
  end
  click_button 'Sign Up'
end

When /^"(.*?)" signs up with the same email$/ do |name|
  visit('/signup')
  within("#new_user") do
    fill_in 'Email', :with => 'pingpong@mailinator.com'
    fill_in 'First Name', :with => name
    fill_in 'Last Name', :with => 'pong'
    fill_in 'user_password', :with => 'passw0rd'
    fill_in 'user_password_confirmation', :with => 'passw0rd'
  end
  click_button 'Sign Up'
end


Given /^I logout$/ do
  find('#login_logout').find_link("Logout").click
end

When /^I login with "(.*?)"$/ do |arg1|
  visit('/login')
  fill_in 'Email', :with => 'pingpong@mailinator.com'
  fill_in 'Password', :with => 'passw0rd'
end

When /^I create a registry named "(.*?)"$/ do |registry_name|
  visit(root_url)
  find_link("Create a registry").click
  within("#new_registry") do
    fill_in 'Registry Name', :with => registry_name
    fill_in 'Description', :with => registry_name
    uncheck('Make Public')
  end
  click_button 'Create'
end

Then /^I see a "(.*?)" of "(.*?)"$/ do |html_attribute, text|
  find(html_attribute).has_content?(text)
end

When /^I add an item to the registry$/ do
  click_link 'Add an item to my registry'
  within("#new_registry_item") do
    fill_in 'Item Name', :with => "a present"
    fill_in 'Description', :with => "something I want"
    fill_in 'Price', :with => "10.00"
  end
  click_button 'Create'
end


