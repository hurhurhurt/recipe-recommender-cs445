require 'rails_helper'

RSpec.describe Recipe, type: :model do
  it "is valid with valid attributes" do
		recipe = Recipe.new(recipe_name: "Chicken Katsu",
												ingredients: "Chicken Breast, Flour, Egg, Panko Bread Crumbs, Oil, Salt, Pepper", 
												calories: "297", 
												food_type: "Chicken", 
												cooking_time: "20")
		expect(recipe).to be_valid
	end
	it "is not valid without a recipe name" do
		recipe = Recipe.new(recipe_name: nil)
		expect(recipe).to_not be_valid
	end
	it "is not valid without ingredients" do
		recipe = Recipe.new(ingredients: nil)
		expect(recipe).to_not be_valid
	end
	it "is not valid without calories" do
		recipe = Recipe.new(calories: nil)
		expect(recipe).to_not be_valid
	end
	it "is not valid without a food type" do
		recipe = Recipe.new(food_type: nil)
		expect(recipe).to_not be_valid
	end
	it "is not valid without a cooking time" do
		recipe = Recipe.new(cooking_time: nil)
		expect(recipe).to_not be_valid
	end
end
