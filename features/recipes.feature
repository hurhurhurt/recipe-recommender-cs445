Feature: Recipes Add, Edit, Delete
  As a registered member
  So that I can use the Recipe Recommender System
  I want to add, edit, and delete recipes from the Recipe Recommender Website

Background: recipes in database
  Given the following recipes exist:
  | recipe_name                         | ingredients                                                                                                                         | food_type | calories | cooking_time |
  | Chicken Katsu                       | Chicken Breast, Flour, Egg, Panko Bread Crumbs, Oil, Salt, Pepper                                                                   | Japanese     | 297      | 20           |
  | Mongolian Chicken                   | Chicken Breast, Cornstarch, Vegetable Oil, Garlic, Ginger, Sriracha, Sesame Oil, Rice Vinegar, Brown Sugar, Soy Sauce, Green Onions | Chinese      | 327      | 30           |
  | Tiramisu Toffee Dessert             | Pound Cake, Coffee, Cream Cheese, Sugar, Chocolate Syrup, Whipping Cream, English Toffee                                            | Japanese     | 434      | 80           |
  | Easy Homemade Pad Thai              | Rice Noodles, Oil, Eggs, Water, Crunchy Peanut Butter, Soy Sauce, Lime Juice, Brown Sugar, Ginger, Bean Sprouts                     | Japanese     | 209      | 10           |
  | Shrimp Red Thai Curry               | Coconut Milk, Red Thai Curry Paste, Fish Sauce, Chili Pepper, Shrimp                                                                | Thai         | 442      | 40           |
  | Thai Curried Tofu                   | Oil, Extra Firm Tofu, Salt, Butter, Garlic, Coconut Milk, Curry Powder, Salt, Black Pepper, Cilantro                                | Thai         | 282      | 45           |
  | Restaurant Style Beef and Broccoli  | Oyster Sauce, Sesame Oil, Soy Sauce, Sugar, Cornstarch, Steak, Oil, Ginger, Garlic, Broccoli                                        | Chinese      | 331      | 60           |
  | Japanese Restaurant Cucumber Salad  | Sugar, Rice Vinegar, Sesame Oil, Chili Paste, Cucumber                                                                              | Japanese     | 55       | 45           |
  | Onigiri                             | Rice, Nori, Water, Salt, Bonito Flakes, Sesame Seeds                                                                                | Japanese     | 744      | 70           |

  Given the following authorizations exist:
  | provider|uid    |user_id|
  | github  |123456 |1      | 
  
  Given the following users exist:
  |name        | email                 |
  |Tester SUNY| stester@binghamton.edu |
  
  Given I am logged into Recipe Recommender
  
@omniauth_test5
Scenario: add recipe
  Given I am on the New Recipe Page
  And I fill in "Name" with "Test"
  And I fill in "Ingredients" with "Test"
  And I select "Thai" from "food Type"
  And I fill in "Calories" with "Test"
  And I fill in "Cooking Time" with "Test"
  And  I press "Save Changes"
  Then the food of "Test" should be "Thai"

@omniauth_test5
Scenario: change food
  When I go to the edit recipe page for "Chicken Katsu"
  And  I select "Chinese" from "food Type"
  And  I press "Update Recipe Info"
  Then the food of "Chicken Katsu" should be "Chinese"
  
@omniauth_test5
Scenario: delete food
  Given I am on the show recipe page for "Chicken Katsu"
  And  I follow "Delete"
  And I go to the New Recipe Page
  Then I should not see "Chicken Katsu"
  
@omniauth_test5
Scenario: Sorting by Name
  Given I am on the Home Page
  When I follow "Recipe Name"
  Then I should see "Chicken Katsu" before "Easy Homemade Pad Thai" 
  
@omniauth_test5
Scenario: Sorting by Calories
  Given I am on the Home Page
  When I follow "Calories"
  Then I should see "Japanese Restaurant Cucumber Salad" before "Easy Homemade Pad Thai"

@omniauth_test5
Scenario: Sorting by Cooking Time
  Given I am on the Home Page
  When I follow "Cooking Time"
  Then I should see "Easy Homemade Pad Thai" before "Chicken Katsu"
  
@omniauth_test5
Scenario: Selecting by food
  Given I am on the Home Page
  And I check the following foods: Japanese
  And I uncheck the following foods: Chinese Thai
  When I press "Refresh"
  Then I should see "Japanese Restaurant Cucumber Salad"
  Then I should not see "Mongolian Chicken"
  
  
  