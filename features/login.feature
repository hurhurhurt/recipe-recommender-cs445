Feature: Login
  As a registered member
  So that I can use the Recipe Recommender System
  I want to login to the Recipe Recommender Website

@omniauth_test3
Scenario: login
  Given I am on the landing page
  And I press "Register or Login with GitHub"
  Then I will see "Welcome back Tester SUNY! You have logged in via github."
#  And I am on the RottenPotatoes Home Page
  And I will see "Welcome to the Recipe Recommender System" # This may be different for you