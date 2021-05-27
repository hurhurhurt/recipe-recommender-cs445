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
  
  def self.similar_recipes ingredients1, ingredients2

    # This function defines the cosine similarity between two lists of ingredients
    # Example input: similar_recipes "Chicken Breast, Salt" "Chicken Breast, Oil"Example
    # Example output: 0.5 
    # The higher the cosine similarity, the more closely two lists of ingredients are related

    tf_vector1 = Array.new()
    tf_vector2 = Array.new()
    s1_token = ingredients1.downcase.split(',')#.downcase!.try(:split,",")#.to_set#.split(',').to_set
    s2_token = ingredients2.downcase.split(',')#.downcase!.try(:split,",")#.to_set#.split(',').to_set
    combined_vect = s1_token | s2_token
    
    for word in combined_vect do
      if s1_token.include? word
        tf_vector1.append(1)
      else
        tf_vector1.append(0)
      end
      if s2_token.include? word
        tf_vector2.append(1)
      else
        tf_vector2.append(0)
      end
    end
    
    c = 0
    combined_vect.each_with_index do |value, index|
      c += tf_vector1[index] * tf_vector2[index]  
    end
        
    cosine = c / ((tf_vector1.sum * tf_vector2.sum)**0.5).to_f
    return cosine
  end    
  
  def self.find_closest_recipe recipe
    
    #This function finds the closest recipe in terms of ingredients to the current one
    #It iterates through our list of recipes and uses similar_recipes() to find the closest match

    list_recipes = Recipe.all #need to define all_recipes function that gets list of all recipes
    sim = 0
    highest = recipe
    for r in list_recipes do
      if similar_recipes(recipe.ingredients, r.ingredients) > sim and recipe != r and recipe.food_type == r.food_type
        sim = similar_recipes(recipe.ingredients, r.ingredients)
        highest = r
      end
    end
    return highest
  end
end