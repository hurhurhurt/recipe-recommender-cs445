Feature: Recipes Add, Edit, Delete
  As a registered member
  So that I can use the Recipe Recommender System
  I want to add, edit, and delete recipes from the Recipe Recommender Website

Background: recipes in database
  Given the following recipes exist:
  | recipe_name                         | ingredients                                                                                                                                                  | food_type   | calories | cooking_time |
  | Beef and Broccoli                   | Oyster Sauce, Sesame Oil, Soy Sauce, Sugar, Cornstarch, Steak, Oil, Ginger, Garlic, Broccoli                                                                 | Beef        | 331      | 60           |
  | Beef Lo Mein                        | Lo Mein Noodles, Sesame Oil, Peanut Oil, Garlic, Ginger, Mixed Vegetables, Steak, Soy Sauce, Sugar, Oyster Sauce                                             | Beef        | 519      | 40           |
  | Korean Beef Bowl                    | Brown Sugar, Soy Sauce, Sesame Oil, Red Pepper Flakes, Ginger, Garlic, Oil, Ground Beef, Green Onions, Sesame Seeds                                          | Beef        | 318      | 15           |
  | Chinese Beef Bowl                   | Hoisin Sauce, Oyster Sauce, Soy Sauce, Brown Sugar, Sesame Oil, Ginger, Garlic, Ground Beef, Green Onions, Sesame Seeds, Shallots, White Pepper              | Beef        | 302      | 12           |
  | Chicken Katsu                       | Chicken Breast, Flour, Egg, Panko Bread Crumbs, Oil, Salt, Pepper                                                                                            | Chicken     | 297      | 20           |
  | Mongolian Chicken                   | Chicken Breast, Cornstarch, Vegetable Oil, Garlic, Ginger, Sriracha, Sesame Oil, Rice Vinegar, Brown Sugar, Soy Sauce, Green Onions                          | Chicken     | 327      | 30           |
  | Sesame Chicken                      | Chicken Thighs, Egg, Cornstarch, Salt, Pepper, Oil, Sesame Oil, Soy Sauce, Rice Vinegar, Brown Sugar, Garlic, Ginger, Chicken Stock, Sesame Seeds            | Chicken     | 309      | 35           |
  | Asian Glazed Chicken Thighs         | Chicken Thighs, Rice Wine Vinegar, Soy Sauce, Honey, Brown Sugar, Sesame Oil, Garlic, Ginger, Bok Choy, Green Onions                                         | Chicken     | 328      | 35           |
  | Tiramisu Toffee Dessert             | Pound Cake, Coffee, Cream Cheese, Sugar, Chocolate Syrup, Whipping Cream, English Toffee                                                                     | Dessert     | 434      | 80           |
  | Vietnamese Iced Coffee Tiramisu     | Water, Condensed Milk, Sugar, Coffee, Cream Cheese, Whipping Cream, Dark Chocolate, Vanilla Essence                                                          | Dessert     | 382      | 120          |
  | Mango Sticky Rice                   | Glutinous Rice, Coconut Milk, Sugar, Salt, Sesame Seeds, Mango                                                                                               | Dessert     | 351      | 90           |
  | Mango Pudding                       | Mango, Gelatin, Coconut Milk, Sugar, Cream, Water                                                                                                            | Dessert     | 249      | 20           |
  | Garlic Ginger Glazed Pork           | Pork Loin, Salt, Pepper, Oil, Garlic, Ginger, Honey, Sriracha, Rice Wine Vinegar                                                                             | Pork        | 269      | 25           |
  | Garlic Ginger Pork Stir Fry         | Beef Broth, Cornstarch, Soy Sauce, Brown Sugar, Sambal Chili Paste, Ginger, Garlic, Pork Loin, Oil, Honey, Carrots, Mushrooms                                | Pork        | 315      | 20           |
  | Char Siu Pork                       | Brown Sugar, Honey, Hoisin Sauce, Soy Sauce, Five Spice Powder, Oil, Pork Shoulder, Honey                                                                    | Pork        | 438      | 95           |
  | Teriyaki Pork Stir Fry              | Oil, Broccoli, Carrots, Bell Peppers, Pork Tenderloin, Ginger, Garlic, Sesame Seeds, Salt, Pepper, Soy Sauce, Brown Sugar, Honey, Sesame Oil, Cornstarch     | Pork        | 278      | 30           |
  | Thai Curried Tofu                   | Oil, Extra Firm Tofu, Salt, Butter, Garlic, Coconut Milk, Curry Powder, Pepper, Cilantro                                                                     | Vegetarian  | 282      | 45           |
  | Sesame Garlic Tofu                  | Oil, Extra Firm Tofu, Salt, Garlic, Cornstarch, Sesame Oil, Pepper, Cilantro, Scallions, Honey, Rice Wine Vinegar, Cornstarch                                | Vegetarian  | 313      | 45           |
  | Japanese Restaurant Cucumber Salad  | Sugar, Rice Vinegar, Sesame Oil, Chili Paste, Cucumber                                                                                                       | Vegetarian  | 55       | 45           |
  | Asian Easy Cucumber Salad           | Sugar, Rice Vinegar, Sesame Oil, Cucumber, Red Onion, Red Pepper, Honey, Sesame Seeds, Red Pepper Flakes                                                     | Vegetarian  | 28       | 10           |

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
  And I select "Chicken" from "Food Type"
  And I fill in "Calories" with "Test"
  And I fill in "Cooking Time" with "Test"
  And I press "Save Changes"
  Then the food of "Test" should be "Chicken"

@omniauth_test5
Scenario: change food
  When I go to the edit recipe page for "Chicken Katsu"
  And  I select "Pork" from "Food Type"
  And  I press "Update Recipe Info"
  And I go to the Home Page
  Then the food of "Chicken Katsu" should be "Pork"
  
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
  Then I should see "Chicken Katsu" before "Thai Curried Tofu" 
  
@omniauth_test5
Scenario: Sorting by Calories
  Given I am on the Home Page
  When I follow "Calories"
  Then I should see "Asian Easy Cucumber Salad" before "Mango Sticky Rice"

@omniauth_test5
Scenario: Sorting by Cooking Time
  Given I am on the Home Page
  When I follow "Cooking Time"
  Then I should see "Asian Easy Cucumber Salad" before "Char Siu Pork"
  
@omniauth_test5
Scenario: Selecting by food
  Given I am on the Home Page
  And I check the following foods: Beef
  And I uncheck the following foods: Chicken Pork Dessert Vegetarian
  When I press "Refresh"
  Then I should see "Korean Beef Bowl"
  Then I should not see "Mango Pudding"
  
@omniauth_test5
Scenario: Similarity
  Given I am on the show recipe page for "Chicken Katsu"
  Then I should see "Recipe that has similar ingredients: Sesame Chicken"
  
  