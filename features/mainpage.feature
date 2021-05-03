<<<<<<< HEAD
#Home page of Recipe Recommender

#Feature: home page of Recipe Recommender

#As a user who wants to find food
#So that I can search for food with various factors
#I want to see what I can make with 'Food Title', 'Recipe Name', 'Cuisine Type', 'Calories', and 'Cooking Time'

#Background: home page of Recipe Recommender

#Given the following boxes and button exist:
#[Food Title]
#[Recipe Name]
#[Cuisine Type]
#[Calories]
#[Cooking Time(min)]
#[APPLY]

#And I am on the Recipe Recommender home page
#Then 5 type-able boxes and 1 button should exist

#Scenario: default string on boxes and button
#When I see the home page
#Then I should see 'Food Title' in 'box 1'
#And I should see 'Recipe Name' in 'box 2'
#And I should see 'Cuisine Type' in 'box 3'
#And I should see 'Calories' in 'box 4'
#And I should see 'Cooking Time(min)' in 'box 5'
#And I should see 'APLLY' in 'button'

#Scenario: type integer in Recipe Name
#When I type '60' in 'box 2'
#Then I press "APPLY"
#Then I should see "ERROR_not_string"

#Scenario: type integer in Cuisine Type
#When I type '60' in 'box 3'
#Then I press "APPLY"
#Then I should see "ERROR_not_string"

#Scenario: type string in Calories
#When I type 'shrimp' in 'box 4'
#Then I press "APPLY"
#Then I should see "ERROR_not_int"

#Scenario: type integer in Cooking Time
#When I type 'shrimp' in 'box 5'
#Then I press "APPLY"
#Then I should see "ERROR_not_int"

#Scenario: Empty input
#When I press "APPLY"
#Then I should see "ERROR_empty_input"	
=======
>>>>>>> 39a664461062c14cb876250d3be31f840b2b36a6
