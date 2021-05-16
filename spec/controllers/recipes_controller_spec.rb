require 'rails_helper'

RSpec.describe RecipesController, type: :controller do
	before(:each) do
		session[:user_id] = nil  
		@user = User.create!(name: 'SUNY Tester', email: 'stester@binghamton.edu')
		@auth = Authorization.create!(provider: "github", uid: "123456", user_id: @user.id)
  end

  describe '#index' do  #there would be quite a few tests here!
    let(:recipe1) {instance_double('Recipe', recipe_name: 'Chicken Katsu', ingredients: 'Chicken Breast, Flour, Egg, Panko Bread Crumbs, Oil, Salt, Pepper', calories: '297', cuisine_type: 'Japanese', cooking_time: '20')}
    let(:recipe2) {instance_double('Recipe', recipe_name: 'Mongolian Chicken', ingredients: 'Chicken Breast, Cornstarch, Vegetable Oil, Garlic, Ginger, Sriracha, Sesame Oil, Rice Vinegar, Brown Sugar, Soy Sauce, Green Onions', calories: '327', cuisine_type: 'Chinese', cooking_time: '30')}
    let(:recipe3) {instance_double('Recipe', recipe_name: 'Shrimp Red Thai Curry', ingredients: 'Coconut Milk, Red Thai Curry Paste, Fish Sauce, Chili Pepper, Shrimp', calories: '442', cuisine_type: 'Thai', cooking_time: '40')}
    let(:recipes) { [recipe1, recipe2, recipe3] }
		it 'Retrieves all the recipes' do
      allow(Recipe).to receive(:all).and_return(recipes)
      get :index
			expect(assigns(:recipes)).to eq([recipe1, recipe2, recipe3])
    end
		
  end

  describe '#new' do
    it 'selects the new template for rendering' do
      get :new
      expect(response).to render_template('new')
    end
  end

  describe '#create' do
    let(:params) { {recipe_name: 'Chicken Katsu', ingredients: 'Chicken Breast, Flour, Egg, Panko Bread Crumbs, Oil, Salt, Pepper', calories: '297', cuisine_type: 'Japanese', cooking_time: '20'} }
    let(:recipe) { instance_double('Recipe', params)}
    it 'Creates a new recipe' do
      expect(Recipe).to receive(:create!).with(params).and_return(recipe)
      post :create, recipe: params
    end
    it 'Sets a flash message' do
      allow(Recipe).to receive(:create!).with(params).and_return(recipe)
      post :create, recipe: params
      expect(flash[:notice]).to match(/^.* was successfully created.$/)  
    end
    it 'Redirects to the recipes page' do
      allow(Recipe).to receive(:create!).with(params).and_return(recipe)
      post :create, recipe: params
      expect(response).to redirect_to(recipes_path)
    end
  end

  describe '#show' do
		let(:id1)  {1}
		let(:user_id1) {1}
		let(:auth1) {@auth}
		let(:user1) {@user}
		let(:params) { {recipe_name: 'Chicken Katsu', ingredients: 'Chicken Breast, Flour, Egg, Panko Bread Crumbs, Oil, Salt, Pepper', calories: '297', cuisine_type: 'Japanese', cooking_time: '20'} }
    let(:recipe) { instance_double('Recipe', params)}
		it 'Retrieves the recipe' do
      expect(controller).to receive(:get_recipe).and_return(recipe)
      get :show, id: id1
    end
    it 'selects the show template for rendering' do
      allow(controller).to receive(:get_recipe).and_return(recipe)
      get :show, id: id1 
      expect(response).to render_template('show') 
    end
    it 'makes the recipe available to the template' do
      allow(controller).to receive(:get_recipe).and_return(recipe)
      get :show, id: id1 
      expect(assigns(:recipe)).to eq(recipe)
    end
  end
=begin
  describe '#edit' do
		let(:id1) {'1'}
		let(:recipe) {instance_double('Recipe', recipe_name: 'Chicken Katsu', ingredients: 'Chicken Breast, Flour, Egg, Panko Bread Crumbs, Oil, Salt, Pepper', calories: '297', cuisine_type: 'Japanese', cooking_time: '20')}
		it 'Retrieves the recipe' do
      expect(controller).to receive(:get_recipe).and_return(recipe)
      get :edit, id: id1 
    end
    it 'selects the edit template for rendering' do
      allow(controller).to receive(:get_recipe).and_return(recipe)
      get :edit, id: id1 
      expect(response).to render_template('edit') 
    end
    it 'makes the recipe available to the template' do
      allow(controller).to receive(:get_recipe).and_return(recipe)
      get :edit, id: id1 
      expect(assigns(:recipe)).to eq(recipe)
    end
  end

  describe '#update' do
    let(:id1) {'1'}
    let(:params) { {:title => 'Alien'} }
    let(:movie) { instance_double('Movie', title: 'Something Else') }
    let(:updated){ instance_double('Movie', title: 'Alien') }
    it 'Retrieves the movie' do
      expect(controller).to receive(:get_movie).and_return(movie)
      allow(movie).to receive(:update_attributes!).with(params)
      put :update, id: id1, movie: params
    end
    it 'Updates the movie attributes' do
      allow(controller).to receive(:get_movie).and_return(movie)
      expect(movie).to receive(:update_attributes!).with(params).and_return(updated)
      put :update, id: id1, movie: params
    end
    it 'Sets a flash message' do
      allow(controller).to receive(:get_movie).and_return(movie)
      allow(movie).to receive(:update_attributes!).with(params).and_return(updated)
      put :update, id: id1, movie: params
      expect(flash[:notice]).to match(/^.* was successfully updated.$/)  
    end
    it 'Redirects to the movies page' do
      allow(controller).to receive(:get_movie).and_return(movie)
      allow(movie).to receive(:update_attributes!).with(params).and_return(updated)
      put :update, id: id1, movie: params
      expect(response).to redirect_to(movie_path(movie))
    end
  end
	
	describe '#destroy' do
			let(:id1) {'1'}
			let(:movie) {instance_double('Movie', title: 'Star Wars')}
			it 'Retrieves the movie' do
				expect(controller).to receive(:get_movie).and_return(movie)
				allow(movie).to receive(:destroy)
				delete :destroy, :id => id1
			end    
			it 'Calls the destroy method to delete the movie' do
				allow(controller).to receive(:get_movie).and_return(movie)
				expect(movie).to receive(:destroy)
				delete :destroy, :id => id1
			end
			it 'Sets the flash message' do
				allow(controller).to receive(:get_movie).and_return(movie)
				allow(movie).to receive(:destroy)
				delete :destroy, :id => id1
				expect(flash[:notice]).to match(/^Movie \'[^']*\' deleted.$/)  
			end
			it 'Redirects to the movies page' do
				allow(controller).to receive(:get_movie).and_return(movie)
				allow(movie).to receive(:destroy)
				delete :destroy, :id => id1
				expect(response).to redirect_to(movies_path)
			end
	end
=end
end
