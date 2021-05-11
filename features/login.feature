Feature: Login
  As a registered member
  So that I can use the Recipe Recommender System
  I want to login to the Recipe Recommender Website

Background: authorization and user in database 
  Given the following authorizations exist:
    | provider|uid    |user_id|
    | github  |123456 |1      | 

    Given the following users exist:
    |name        | email                 |
    |Tester SUNY| stester@binghamton.edu |


@omniauth_test3
Scenario: login
  Given I am on the landing page
  And I press "Register or Login with GitHub"
  Then I will see "Welcome back Tester SUNY! You have logged in via github."
  And I am on the Home Page
  Then I will see "All Recipes" 