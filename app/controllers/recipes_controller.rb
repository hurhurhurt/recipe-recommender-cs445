require 'set'
require 'string/similarity'
class RecipesController < ApplicationController
   
  def show
    #id = params[:id] 
    #@recipe = Recipe.find(id) 
    # will render app/views/movies/show.<extension> by default
    @recipe = set_recipe
    
  end

  def index

    update_session_hash
    render_redirect
    #determine_highlighting
    
    #@recipes = Recipe.all
    @all_cuisines = Recipe.all_cuisines
    @selected_cuisines_hash = session[:cuisines] #params[:ratings] || select_all_hash
    @selected_cuisines = selected_cuisines
    @sorting = session[:sorting] #params[:sorting] || "id"
    @recipes = Recipe.filter_and_sort(@selected_cuisines,@sorting)

  end

  def new
    # default: render 'new' template
  end

  def create
    @recipe = Recipe.create!(recipe_params)
    flash[:notice] = "#{@recipe.recipe_name} was successfully created."
    redirect_to recipes_path
  end

  def edit
    @recipe = set_recipe 
  end

  def update
    @recipe = set_recipe
    @recipe.update_attributes!(recipe_params)
    flash[:notice] = "#{@recipe.recipe_name} was successfully updated."
    redirect_to recipe_path(@recipe)
  end

  def destroy
    @recipe = set_recipe
    @recipe.destroy
    flash[:notice] = "Recipe '#{@recipe.recipe_name}' deleted."
    redirect_to recipes_path
  end
	
	
  private
  # Making "internal" methods private is not required, but is a common practice.
  # This helps make clear which methods respond to requests, and which ones do not.
  def recipe_params
    params.require(:recipe).permit(:recipe_name, :ingredients, :calories, :cuisine_type, :cooking_time)
  end

  def selected_cuisines
    @selected_cuisines_hash.keys
  end
  
  def select_all_hash
    Hash[ Recipe.all_cuisines.map { |cuisine_type| [ cuisine_type , "1" ] } ]
  end
  
  def update_session_hash
    session[:cuisines] = params[:cuisines] || session[:cuisines] || select_all_hash
    session[:sorting] = params[:sorting] || session[:sorting] || "id"
  end
  
  def render_redirect
    return unless (session[:cuisines] and params[:cuisines].nil? ) or
                  (session[:sorting] and params[:sorting].nil? )
    redirect_to recipes_path(:sorting => session[:sorting] , :cuisines => session[:cuisines]) and return 
  end
  
	def set_recipe
		@recipe = Recipe.find params[:id]
	end
  
  def similar_recipes ingredients1, ingredients2
=begin

This function defines the cosine similarity between two lists of ingredients
Example input: similar_recipes "Chicken Breast, Salt" "Chicken Breast, Oil"Example
Example output: 0.5 

The higher the cosine similarity, the more closely two lists of ingredients are related

=end
    tf_vector1 = Array.new()
    tf_vector2 = Array.new()

    s1_token = ingredients1.downcase!.split(',').to_set
    s2_token = ingredients2.downcase!.split(',').to_set
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
  end    
  
  def find_closest_recipe recipe 
=begin

This function finds the closest recipe in terms of ingredients to the current one
It iterates through our list of recipes and uses similar_recipes() to find the closest match

=end
    list_recipes = all_recipes #need to define all_recipes function that gets list of all recipes
    sim = 0
    highest = recipe
    for r in list_recipes do
      if similar_recipes(recipe.Ingredients, r.Ingredients) > sim and recipe != r
        sim = similar_recipes(recipe.Ingredients, r.Ingredients)
        highest = r
      end
    end
end
