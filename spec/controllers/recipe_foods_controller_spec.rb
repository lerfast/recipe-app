# spec/controllers/recipe_foods_controller_spec.rb

require 'rails_helper'

RSpec.describe RecipeFoodsController, type: :controller do
  let(:user) { User.create!(name: 'Test User', email: 'test@example.com', password: 'password') }
  let(:recipe) { Recipe.create!(name: 'Test Recipe', user: user) }
  let(:food) { Food.create!(name: 'Test Food', measurement_unit: 'kg', price: 5, user: user) }
  let(:valid_attributes) { { quantity: 1, recipe_id: recipe.id, food_id: food.id } }

  before do
    sign_in user
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new RecipeFood' do
        expect {
          post :create, params: { recipe_id: recipe.id, recipe_food: valid_attributes }
        }.to change(RecipeFood, :count).by(1)
      end

      it 'redirects to the recipe' do
        post :create, params: { recipe_id: recipe.id, recipe_food: valid_attributes }
        expect(response).to redirect_to(recipe_path(recipe))
      end
    end

    # ... (similar tests for update, destroy, etc.)
  end
end
