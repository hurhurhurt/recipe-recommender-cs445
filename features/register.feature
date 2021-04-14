# feature/register.feature
Feature: Register
  As a user who wants to find food
  So that I can access to Recipe Recommender website
  I want to register in to Recipe Recommender website
  
Scenario: Register
  Given I am on the landing page
  And I press "REGISTER"
  Then I am on the RecipeRecommender new Profile page
  And I should see message "Welcome Tester Suny! You have signed up via GitHub."

Scenario:  Can't Register without SUNY ID
  Given I am on the landing page
  And I press "REGISTER"
  Then I should see message "Only Students and Staff belonging to SUNY Binghamton can register for this app"