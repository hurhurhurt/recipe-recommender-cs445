require 'set'
class RecipesController < ApplicationController
   
  def show
    #id = params[:id] 
    #@recipe = Recipe.find(id) 
    # will render app/views/movies/show.<extension> by default
    @recipe = set_recipe
    @close_recipe = Recipe.find_closest_recipe(@recipe)
  end

  def index

    update_session_hash
    render_redirect
    #determine_highlighting
    
    #@recipes = cccc
    @all_foods = Recipe.all_foods
    @selected_foods_hash = session[:foods] #params[:ratings] || select_all_hash
    @selected_foods = selected_foods
    @sorting = session[:sorting] #params[:sorting] || "id"
    @recipes = Recipe.filter_and_sort(@selected_foods,@sorting)

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
    params.require(:recipe).permit(:recipe_name, :ingredients, :calories, :food_type, :cooking_time)
  end

  def selected_foods
    @selected_foods_hash.keys
  end
  
  def select_all_hash
    Hash[ Recipe.all_foods.map { |food_type| [ food_type , "1" ] } ]
  end
  
  def update_session_hash
    session[:foods] = params[:foods] || session[:foods] || select_all_hash
    session[:sorting] = params[:sorting] || session[:sorting] || "id"
  end
  
  def render_redirect
    return unless (session[:foods] and params[:foods].nil? ) or
                  (session[:sorting] and params[:sorting].nil? )
    redirect_to recipes_path(:sorting => session[:sorting] , :foods => session[:foods]) and return 
  end
  
	def set_recipe
		@recipe = Recipe.find params[:id]
	end
end