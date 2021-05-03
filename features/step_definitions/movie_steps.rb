Then(/^I should see the welcome message$/) do
  expect(page).to have_content("Welcome to Rotten Potatoes!")
end

Given /the following profiles exist/ do |profiles_table|
  profiles_table.hashes.each do |profile|
    Profile.create profile
  end 
  
Then /^I will see "([^"]*)"$/ do |message|
  expect(page.body).to have_content(message)
end

Then /^I will see "([^"]*)"$/ do |message|
  puts page.body # <---
  expect(page.body).to have_content(message)
end

Given /I am logged into Recipe Recommender/ do
  steps %Q{
    Given I am on the Landing Page   
    And I press "Register or Login with GitHub"
    And I am on the Home Page
    }
end

end
