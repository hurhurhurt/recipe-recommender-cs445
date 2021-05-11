Feature: Recipes Add, Edit, Delete
  As a registered member
  So that I can use the Recipe Recommender System
  I want to add, edit, and delete recipes from the Recipe Recommender Website

Background: recipes in database
  Given the following recipes exist:
  | recipe_name                         | ingredients                                                                                                                         | cuisine_type | calories | cooking_time |
  | Chicken Katsu                       | Chicken Breast, Flour, Egg, Panko Bread Crumbs, Oil, Salt, Pepper                                                                   | Japanese     | 297      | 20           |
  | Mongolian Chicken                   | Chicken Breast, Cornstarch, Vegetable Oil, Garlic, Ginger, Sriracha, Sesame Oil, Rice Vinegar, Brown Sugar, Soy Sauce, Green Onions | Chinese      | 327      | 30           |
  | Tiramisu Toffee Dessert             | Pound Cake, Coffee, Cream Cheese, Sugar, Chocolate Syrup, Whipping Cream, English Toffee                                            | Japanese     | 434      | 80           |
  | Easy Homemade Pad Thai              | Rice Noodles, Oil, Eggs, Water, Crunchy Peanut Butter, Soy Sauce, Lime Juice, Brown Sugar, Ginger, Bean Sprouts                     | Japanese     | 209      | 10           |
  | Shrimp Red Thai Curry               | Coconut Milk, Red Thai Curry Paste, Fish Sauce, Chili Pepper, Shrimp                                                                | Thai         | 442      | 40           |
  | Thai Curried Tofu                   | Oil, Extra Firm Tofu, Salt, Butter, Garlic, Coconut Milk, Curry Powder, Salt, Black Pepper, Cilantro                                | Thai         | 282      | 45           |
  | Restaurant Style Beef and Broccoli  | Oyster Sauce, Sesame Oil, Soy Sauce, Sugar, Cornstarch, Steak, Oil, Ginger, Garlic, Broccoli                                        | Chinese      | 331      | 60           |
  | Japanese Restaurant Cucumber Salad  | Sugar, Rice Vinegar, Sesame Oil, Chili Paste, Cucumber                                                                              | Japanese     | 55       | 45           |
  | Onigiri                             | Rice, Nori, Water, Salt, Bonito Flakes, Sesame Seeds                                                                                | Japanese     | 744      | 70           |


@new_recipe
Scenario: add recipe
  Given I am on the Home Page
  When I press "Add new recipe"
  And I fill in "Name" with "Test"
  And I select "Thai" from "Cuisine Type"
  And  I press "Update Recipe Info"
  Then the cuisine of "Test" should be "Thai"

@edit_recipe
Scenario: change cuisine
  When I go to the edit recipe page for "Chicken Katsu"
  And  I select "Chinese" from "Cuisine Type"
  And  I press "Update Recipe Info"
  Then the cuisine of "Chicken Katsu" should be "Chinese"
  
#@delete_recipe
#Scenario: delete cuisine
#  When I go to the recipe page for "Chicken Katsu"
#  And  I press "Delete"
#  Then I should not see "Chicken Katsu"