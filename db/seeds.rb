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
  
recipes = [{:recipe_name => 'Chicken Katsu', :ingredients => 'Chicken Breast, Flour, Egg, Panko Bread Crumbs, Oil, Salt, Pepper',:calories=> 297, :food_type => 'Chicken', :cooking_time=>20},
          {:recipe_name => 'Mongolian Chicken', :ingredients => 'Chicken Breast, Cornstarch, Vegetable Oil, Garlic, Ginger, Sriracha, Sesame Oil, Rice Vinegar, Brown Sugar, Soy Sauce, Green Onions',:calories=> 327, :food_type => 'Chinese', :cooking_time=>30},
          {:recipe_name => 'Tiramisu Toffee Dessert', :ingredients => 'Pound Cake, Coffee, Cream Cheese, Sugar, Chocolate Syrup, Whipping Cream, English Toffee',:calories=> 434, :food_type => 'Japanese', :cooking_time=>80},
          {:recipe_name => 'Easy Homemade Pad Thai', :ingredients => 'Rice Noodles, Oil, Eggs, Water, Crunchy Peanut Butter, Soy Sauce, Lime Juice, Brown Sugar, Ginger, Bean Sprouts',:calories=> 209, :food_type => 'Japanese', :cooking_time=>10},
          {:recipe_name => 'Shrimp Red Thai Curry', :ingredients => 'Coconut Milk, Red Thai Curry Paste, Fish Sauce, Chili Pepper, Shrimp',:calories=> 442, :food_type => 'Thai', :cooking_time=>40},
          {:recipe_name => 'Thai Curried Tofu', :ingredients => 'Oil, Extra Firm Tofu, Salt, Butter, Garlic, Coconut Milk, Curry Powder, Salt, Black Pepper, Cilantro',:calories=> 282, :food_type => 'Thai', :cooking_time=>45},
          {:recipe_name => 'Restaurant Style Beef and Broccoli', :ingredients => 'Oyster Sauce, Sesame Oil, Soy Sauce, Sugar, Cornstarch, Steak, Oil, Ginger, Garlic, Broccoli',:calories=> 331, :food_type => 'Chinese', :cooking_time=>60},
          {:recipe_name => 'Japanese Restaurant Cucumber Salad', :ingredients => 'Sugar, Rice Vinegar, Sesame Oil, Chili Paste, Cucumber',:calories=> 55, :food_type => 'Japanese', :cooking_time=>45},
          {:recipe_name => 'Onigiri', :ingredients => 'Rice, Nori, Water, Salt, Bonito Flakes, Sesame Seeds',:calories=> 744, :food_type => 'Japanese', :cooking_time=>70},
        
      ]
recipes.each do |recipe|
    Recipe.create!(recipe)
end