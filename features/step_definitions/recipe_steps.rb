Then(/^I should see the welcome message$/) do
  expect(page).to have_content("Welcome to Rotten Potatoes!")
end

Given /the following users exist/ do |users_table|
  users_table.hashes.each do |user|
    User.create! user
  end 
end

Given /the following authorizations exist/ do |authorizations_table|
  authorizations_table.hashes.each do |authorization|
    Authorization.create! authorization
  end 
end

Given /the following profiles exist/ do |profiles_table|
  profiles_table.hashes.each do |profile|
    Profile.create! profile
  end 
end

Given /the following recipes exist/ do |recipes_table|
  recipes_table.hashes.each do |recipe|
    Recipe.create! recipe
  end 
end

Then /^I will see "([^"]*)"$/ do |message|
  puts page.body 
  expect(page.body).to have_content(message)
end

Given /I am logged into Recipe Recommender/ do
  steps %Q{
    Given I am on the landing page   
    And I press "Register or Login with GitHub"
    And I am on the Home Page
    }
end

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  #  ensure that that e1 occurs before e2.
  #  page.body is the entire content of the page as a string.
  if not /#{e1}.*#{e2}.*/m.match(page.body)
    flunk e1 + " and " + e2 + " are in the wrong position"
  end
end

When /I (un)?check the following foods: (.*)/ do |uncheck, food_list|
  # HINT: use String#split to split up the rating_list, then
  #   iterate over the ratings and reuse the "When I check..." or
  #   "When I uncheck..." steps in lines 89-95 of web_steps.rb
  food_list_split = food_list.split()
  food_list_split.each do |food_type|
	step %Q{I #{uncheck}check "foods[#{food_type}]"}
  end
  #fail "Unimplemented"
end
