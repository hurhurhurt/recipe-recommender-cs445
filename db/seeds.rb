# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
profiles = [{:primary_language => 'English', :secondary_language => 'I', :favorite_movie => 'Up', :worst_movie => 'Down', :favorite_genre => 'SF', :user_id => 1}
     ]
profiles.each do |profile|
  Profile.create!(profile)
end
  
recipes = [
  {:recipe_name => 'Chicken Katsu', :ingredients => 'Chicken Breast, Flour, Egg, Panko Bread Crumbs, Oil, Salt, Pepper',:calories=> 297, :food_type => 'Chicken', :cooking_time=>20},
  {:recipe_name => 'Mongolian Chicken', :ingredients => 'Chicken Breast, Cornstarch, Vegetable Oil, Garlic, Ginger, Sriracha, Sesame Oil, Rice Vinegar, Brown Sugar, Soy Sauce, Green Onions',:calories=> 327, :food_type => 'Chicken', :cooking_time=>30},
  {:recipe_name => 'Sesame Chicken', :ingredients => 'Chicken Thighs, Egg, Cornstarch, Salt, Pepper, Oil, Sesame Oil, Soy Sauce, Rice Vinegar, Brown Sugar, Garlic, Ginger, Chicken Stock, Sesame Seeds',:calories=> 309, :food_type => 'Chicken', :cooking_time=>35},
  {:recipe_name => 'Asian Glazed Chicken Thighs', :ingredients => 'Chicken Thighs, Rice Wine Vinegar, Soy Sauce, Honey, Brown Sugar, Sesame Oil, Garlic, Ginger, Bok Choy, Green Onions',:calories=> 328, :food_type => 'Chicken', :cooking_time=>35},
  {:recipe_name => 'Garlic Ginger Glazed Pork', :ingredients => 'Pork Loin, Salt, Pepper, Oil, Garlic, Ginger, Honey, Sriracha, Rice Wine Vinegar',:calories=> 269, :food_type => 'Pork', :cooking_time=>25},
  {:recipe_name => 'Garlic Ginger Pork Stir Fry', :ingredients => 'Beef Broth, Cornstarch, Soy Sauce, Brown Sugar, Sambal Chili Paste, Ginger, Garlic, Pork Loin, Oil, Honey, Carrots, Mushrooms',:calories=> 315, :food_type => 'Pork', :cooking_time=>20},
  {:recipe_name => 'Char Siu Pork', :ingredients => 'Brown Sugar, Honey, Hoisin Sauce, Soy Sauce, Five Spice Powder, Oil, Pork Shoulder, Honey',:calories=> 438, :food_type => 'Pork', :cooking_time=>95},
  {:recipe_name => 'Teriyaki Pork Stir Fry', :ingredients => 'Oil, Broccoli, Carrots, Bell Peppers, Pork Tenderloin, Ginger, Garlic, Sesame Seeds, Salt, Pepper, Soy Sauce, Brown Sugar, Honey, Sesame Oil, Cornstarch',:calories=> 278, :food_type => 'Pork', :cooking_time=>30},
  {:recipe_name => 'Beef and Broccoli', :ingredients => 'Oyster Sauce, Sesame Oil, Soy Sauce, Sugar, Cornstarch, Steak, Oil, Ginger, Garlic, Broccoli',:calories=> 331, :food_type => 'Beef', :cooking_time=>60},
  {:recipe_name => 'Beef Lo Mein', :ingredients => 'Lo Mein Noodles, Sesame Oil, Peanut Oil, Garlic, Ginger, Mixed Vegetables, Steak, Soy Sauce, Sugar, Oyster Sauce',:calories=> 519, :food_type => 'Beef', :cooking_time=>40},
  {:recipe_name => 'Korean Beef Bowl', :ingredients => 'Brown Sugar, Soy Sauce, Sesame Oil, Red Pepper Flakes, Ginger, Garlic, Oil, Ground Beef, Green Onions, Sesame Seeds',:calories=> 318, :food_type => 'Beef', :cooking_time=>15},
  {:recipe_name => 'Chinese Beef Bowl', :ingredients => 'Hoisin Sauce, Oyster Sauce, Soy Sauce, Brown Sugar, Sesame Oil, Ginger, Garlic, Ground Beef, Green Onions, Sesame Seeds, Shallots, White Pepper',:calories=> 302, :food_type => 'Beef', :cooking_time=>12},
  {:recipe_name => 'Tiramisu Toffee Dessert', :ingredients => 'Pound Cake, Coffee, Cream Cheese, Sugar, Chocolate Syrup, Whipping Cream, English Toffee',:calories=> 434, :food_type => 'Dessert', :cooking_time=>80},
  {:recipe_name => 'Vietnamese Iced Coffee Tiramisu', :ingredients => 'Water, Condensed Milk, Sugar, Coffee, Cream Cheese, Whipping Cream, Dark Chocolate, Vanilla Essence',:calories=> 382, :food_type => 'Dessert', :cooking_time=>120},
  {:recipe_name => 'Mango Sticky Rice', :ingredients => 'Glutinous Rice, Coconut Milk, Sugar, Salt, Sesame Seeds, Mango',:calories=> 351, :food_type => 'Dessert', :cooking_time=>90},
  {:recipe_name => 'Mango Pudding', :ingredients => 'Mango, Gelatin, Coconut Milk, Sugar, Cream, Water',:calories=> 249, :food_type => 'Dessert', :cooking_time=>20},
  {:recipe_name => 'Thai Curried Tofu', :ingredients => 'Oil, Extra Firm Tofu, Salt, Butter, Garlic, Coconut Milk, Curry Powder, Pepper, Cilantro',:calories=> 282, :food_type => 'Vegetarian', :cooking_time=>45},
  {:recipe_name => 'Sesame Garlic Tofu', :ingredients => 'Oil, Extra Firm Tofu, Salt, Garlic, Cornstarch, Sesame Oil, Pepper, Cilantro, Scallions, Honey, Rice Wine Vinegar, Cornstarch',:calories=> 313, :food_type => 'Vegetarian', :cooking_time=>45},
  {:recipe_name => 'Japanese Restaurant Cucumber Salad', :ingredients => 'Sugar, Rice Vinegar, Sesame Oil, Chili Paste, Cucumber',:calories=> 55, :food_type => 'Vegetarian', :cooking_time=>45},
  {:recipe_name => 'Asian Easy Cucumber Salad', :ingredients => 'Sugar, Rice Vinegar, Sesame Oil, Cucumber, Red Onion, Red Pepper, Honey, Sesame Seeds, Red Pepper Flakes',:calories=> 28, :food_type => 'Vegetarian', :cooking_time=>10},
        
      ]
recipes.each do |recipe|
    Recipe.create!(recipe)
end