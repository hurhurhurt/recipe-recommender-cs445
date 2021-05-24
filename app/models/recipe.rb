class Recipe < ActiveRecord::Base
	validates_presence_of :recipe_name
	validates_presence_of :ingredients
	validates_presence_of :calories
	validates_presence_of :food_type
	validates_presence_of :cooking_time
	
	def self.all_foods
    %w(Chicken Beef Pork Dessert Vegetarian)
  end

  def self.filter_and_sort(selected_foods, sorting)
    Recipe.where(food_type:selected_foods).order(sorting)
  end

end