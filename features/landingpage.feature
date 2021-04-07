#Landing page of Recipe Recommender

Feature: Landing page of Recipe Recommender

As a user who wants to find food
So that I can access to Recipe Recommender website
I want to log in to Recipe Recommender website

Background: landing page of Recipe Recommender

Given the following texts, boxes and button exist:
Recipe Recommender
[ID]
[PASS]
[LOGIN]
[REGISTER]
About Recipe Recommender

And I am on the Recipe Recommender landing page
Then 2 texts, 2 type-able boxes and 2 button should exist

Scenario: default string on boxes and button
When I see the home page
Then I should see 'Recipe Recommender'
And I should see 'ID' in 'box 1'
And I should see 'PASS' in 'box 2'
And I should see 'LOGIN' in 'button1'
And I should see 'REGISTER' in 'button2'
And I should see 'About Recipe Recommender'

Scenario: Login to Recipe Recommender
When I type 'Admin123' in 'box 1'
Then I type 'pass123123' in 'box 2'
Then I press "LOGIN"
Then I should see "MAIN_PAGE"

Scenario: Login failed by not-exist-id
When I type 'Haker123' in 'box 1'
Then I type 'hacking123123' in 'box2'
Then I press "LOGIN"
Then I should see "ERROR_LOGIN_FAILED_NOID"

Scenario: Login failed by wrong pass
When I type 'Admin123' in 'box 1'
Then I type 'hacking123123' in 'box 2'
Then I press "LOGIN"
Then I should see "ERROR_LOGIN_FAILED_NOPASS"

Scenario: Login failed by empty_all
When I press "LOGIN"
Then I should see "ERROR_LOGIN_FAILED_EMPTY"

Scenario: Login failed by empty_pass
When I type 'Admin123' in 'box 1'
Then I press "LOGIN"
Then I should see "ERROR_LOGIN_FAILED_EMPTY"

Scenario: Login failed by empty_id
When I type 'pass123123' in 'box 2'
Then I press "LOGIN"
Then I should see "ERROR_LOGIN_FAILED_EMPTY"

Scenario: Register new user
When I press "REGISTER"
Then I should see "REGISTER_PAGE"