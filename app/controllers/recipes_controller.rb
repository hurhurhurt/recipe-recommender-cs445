class RecipesController < ApplicationController
   
  def show
    id = params[:id] # retrieve movie ID from URI route
    @recipe = Recipe.find(id) # look up movie by unique ID
    # will render app/views/movies/show.<extension> by default
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
    @recipe = Recipe.find params[:id]
  end

  def update
    @recipe = Recipe.find params[:id]
    @recipe.update_attributes!(recipe_params)
    flash[:notice] = "#{@recipe.recipe_name} was successfully updated."
    redirect_to recipe_path(@recipe)
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    flash[:notice] = "Recipe '#{@recipe.recipe_name}' deleted."
    redirect_to recipes_path
  end
	
	
  private
  # Making "internal" methods private is not required, but is a common practice.
  # This helps make clear which methods respond to requests, and which ones do not.
  def recipe_params
    params.require(:recipe).permit(:recipe_name, :ingredients, :cuisine_type, :calories, :cooking_time)
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
    redirect_to recipes_path(:cuisines => session[:cuisines], :sorting => session[:sorting]) and return 
  end
  
	def get_recipe
		@recipe = Recipe.find params[:id]
	end
end
