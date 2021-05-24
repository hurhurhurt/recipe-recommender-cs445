require 'rails_helper'

RSpec.describe RecipesController, type: :controller do
	before(:each) do 
		@user = User.create!(name: 'SUNY Tester', email: 'stester@binghamton.edu')
		@auth = Authorization.create!(provider: "github", uid: "123456", user_id: @user.id)
    session[:user_id] = @user.id
    @current_user = @user
  end

  describe '#create' do
    let(:recipe_params) { {recipe_name: 'Chicken Katsu', ingredients: 'Chicken Breast, Flour, Egg, Panko Bread Crumbs, Oil, Salt, Pepper', calories: '297', food_type: 'Japanese', cooking_time: '20'} }
    let(:recipe) { instance_double('Recipe', recipe_params)}
    it 'Creates a new recipe' do
      expect(Recipe).to receive(:create!).with(recipe_params).and_return(recipe)
      post :create, recipe: recipe_params
    end
    it 'Sets a flash message' do
      allow(Recipe).to receive(:create!).with(recipe_params).and_return(recipe)
      post :create, recipe: recipe_params
      expect(flash[:notice]).to match(/^.* was successfully created.$/)  
    end
    it 'Redirects to the recipes page' do
      allow(Recipe).to receive(:create!).with(recipe_params).and_return(recipe)
      post :create, recipe: recipe_params
      expect(response).to redirect_to(recipes_path)
    end
  end

  describe '#index' do  #there would be quite a few tests here!
    let(:foods) { %w(Japanese Chinese Thai) }
    let(:recipe1) {instance_double('Recipe', recipe_name: 'Chicken Katsu', ingredients: 'Chicken Breast, Flour, Egg, Panko Bread Crumbs, Oil, Salt, Pepper', calories: '297', food_type: 'Japanese', cooking_time: '20')}
    let(:recipe2) {instance_double('Recipe', recipe_name: 'Mongolian Chicken', ingredients: 'Chicken Breast, Cornstarch, Vegetable Oil, Garlic, Ginger, Sriracha, Sesame Oil, Rice Vinegar, Brown Sugar, Soy Sauce, Green Onions', calories: '327', food_type: 'Chinese', cooking_time: '30')}
    let(:recipe3) {instance_double('Recipe', recipe_name: 'Shrimp Red Thai Curry', ingredients: 'Coconut Milk, Red Thai Curry Paste, Fish Sauce, Chili Pepper, Shrimp', calories: '442', food_type: 'Thai', cooking_time: '40')}
    let(:recipes) { [recipe1, recipe2, recipe3] }
		it 'Retrieves all the food_types' do
      allow(Recipe).to receive(:all_foods).and_return(foods)
      get :index
			expect(assigns(:all_foods)).to eq(foods)
    end
		
  end

  describe '#new' do
    it 'selects the new template for rendering' do
      get :new
      expect(response).to render_template('new')
    end
  end

  describe '#show' do
		let(:id1)  {1}
		let(:params) { {recipe_name: 'Chicken Katsu', ingredients: 'Chicken Breast, Flour, Egg, Panko Bread Crumbs, Oil, Salt, Pepper', calories: '297', food_type: 'Japanese', cooking_time: '20'} }
    let(:recipe) { instance_double('Recipe', params)}
		it 'Retrieves the recipe' do
      expect(controller).to receive(:set_recipe).and_return(recipe)
      get :show, id: id1
    end
    it 'selects the show template for rendering' do
      allow(controller).to receive(:set_recipe).and_return(recipe)
      get :show, id: id1 
      expect(response).to render_template('show') 
    end
    it 'makes the recipe available to the template' do
      allow(controller).to receive(:set_recipe).and_return(recipe)
      get :show, id: id1
      expect(assigns(:recipe)).to eq(recipe)
    end
  end

  describe '#edit' do
		let(:id1) {'1'}
		let(:recipe) {instance_double('Recipe', recipe_name: 'Chicken Katsu', ingredients: 'Chicken Breast, Flour, Egg, Panko Bread Crumbs, Oil, Salt, Pepper', calories: '297', food_type: 'Japanese', cooking_time: '20')}
		it 'Retrieves the recipe' do
      expect(controller).to receive(:set_recipe).and_return(recipe)
      get :edit, id: id1 
    end
    it 'selects the edit template for rendering' do
      allow(controller).to receive(:set_recipe).and_return(recipe)
      get :edit, id: id1 
      expect(response).to render_template('edit') 
    end
    it 'makes the recipe available to the template' do
      allow(controller).to receive(:set_recipe).and_return(recipe)
      get :edit, id: id1 
      expect(assigns(:recipe)).to eq(recipe)
    end
  end

  describe '#update' do
    let(:id1) {'1'}
    let(:params) { {recipe_name: 'Chicken Katsu', ingredients: 'Chicken Breast, Flour, Egg, Panko Bread Crumbs, Oil, Salt, Pepper', calories: '297', food_type: 'Japanese', cooking_time: '20'} }
    let(:params1) { {recipe_name: 'Chicken Katsu', ingredients: 'Chicken Breast, Flour, Egg, Panko Bread Crumbs, Oil, Salt, Pepper', calories: '350', food_type: 'Japanese', cooking_time: '20'} }
    let(:recipe) { instance_double('Recipe', recipe_name: 'Chicken Katsu', ingredients: 'Chicken Breast, Flour, Egg, Panko Bread Crumbs, Oil, Salt, Pepper', calories: '297', food_type: 'Japanese', cooking_time: '20')}
	  let(:updated){ instance_double('Recipe', recipe_name: 'Chicken Katsu', ingredients: 'Chicken Breast, Flour, Egg, Panko Bread Crumbs, Oil, Salt, Pepper', calories: '350', food_type: 'Japanese', cooking_time: '20')}
    it 'Retrieves the recipe' do
      expect(controller).to receive(:set_recipe).and_return(recipe)
      allow(recipe).to receive(:update_attributes!).with(params1).and_return(updated)
      put :update, id: id1, recipe: params1
    end
    it 'Updates the recipe attributes' do
      allow(controller).to receive(:set_recipe).and_return(recipe)
      expect(recipe).to receive(:update_attributes!).with(params1).and_return(updated)
      put :update, id: id1, recipe: params1
    end
    it 'Sets a flash message' do
      allow(controller).to receive(:set_recipe).and_return(recipe)
      allow(recipe).to receive(:update_attributes!).with(params1).and_return(updated)
      put :update, id: id1, recipe: params1
      expect(flash[:notice]).to match(/^.* was successfully updated.$/)  
    end
    it 'Redirects to the recipes page' do
      allow(controller).to receive(:set_recipe).and_return(recipe)
      allow(recipe).to receive(:update_attributes!).with(params1).and_return(updated)
      put :update, id: id1, recipe: params1
      expect(response).to redirect_to(recipe_path(recipe))
    end
  end

	describe '#destroy' do
			let(:id1) {'1'}
	    let(:recipe) { instance_double('Recipe', recipe_name: 'Chicken Katsu', ingredients: 'Chicken Breast, Flour, Egg, Panko Bread Crumbs, Oil, Salt, Pepper', calories: '297', food_type: 'Japanese', cooking_time: '20')}
			it 'Retrieves the recipe' do
				expect(controller).to receive(:set_recipe).and_return(recipe)
				allow(recipe).to receive(:destroy)
				delete :destroy, :id => id1
			end    
			it 'Calls the destroy method to delete the recipe' do
				allow(controller).to receive(:set_recipe).and_return(recipe)
				expect(recipe).to receive(:destroy)
				delete :destroy, :id => id1
			end
			it 'Sets the flash message' do
				allow(controller).to receive(:set_recipe).and_return(recipe)
				allow(recipe).to receive(:destroy)
				delete :destroy, :id => id1
				expect(flash[:notice]).to match(/^Recipe \'[^']*\' deleted.$/)  
			end
			it 'Redirects to the recipes page' do
				allow(controller).to receive(:set_recipe).and_return(recipe)
				allow(recipe).to receive(:destroy)
				delete :destroy, :id => id1
				expect(response).to redirect_to(recipes_path)
			end
  end
end
