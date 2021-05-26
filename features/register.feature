Feature: Register
  As a user who wants to find food
  So that I can access the Recipe Recommender website
  I want to register on Recipe Recommender website
 
# feature/register.feature
@omniauth_test1
Scenario: Register
  Given I am on the landing page
  And I press "Register or Login with GitHub"
  Then I will see "Welcome Tester SUNY! You have signed up via github."
  And I will see "All Recipes" 
  
@omniauth_test2
Scenario:  Can't Register without SUNY ID
  Given I am on the landing page
  And I press "Register or Login with GitHub"
  Then I will see "ActiveRecord::RecordInvalid: Validation failed: Email must be for Binghamton University"
  #And I am on the Main Page

  
  