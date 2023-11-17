# spec/controllers/public_recipes_controller_spec.rb

require 'rails_helper'

RSpec.describe PublicRecipesController, type: :controller do
  describe 'GET #index' do
    it 'renders the index template' do
      get :index
      expect(response).to render_template(:index)
    end

    it 'assigns @public_recipes' do
      recipe = Recipe.create!(name: 'Test Recipe', public: true, user: create(:user))
      get :index
      expect(assigns(:public_recipes)).to eq([recipe])
    end
  end
end
