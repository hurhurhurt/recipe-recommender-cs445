class Recipe < ActiveRecord::Base
	validates_presence_of :recipe_name
	validates_presence_of :ingredients
	validates_presence_of :calories
	validates_presence_of :cuisine_type
	validates_presence_of :cooking_time
	
	def self.all_cuisines
    %w(Japanese Chinese Thai)
  end

  def self.filter_and_sort(selected_cuisines, sorting)
    Recipe.where(cuisine_type:selected_cuisines).order(sorting)
  end

end