Feature: Login
  As a registered member
  So that can see information about movies that interest me
  I want to login to the RottenPotatoes application

@omniauth_test3
Scenario: login
  Given I am on the landing page
  And I press "Register or Login with GitHub"
  Then I will see "Welcome back Tester SUNY! You have logged in via github."
  And I am on the RottenPotatoes Home Page
  And I will see "All Movies" # This may be different for you