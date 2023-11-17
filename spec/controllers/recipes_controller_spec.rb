# spec/controllers/recipes_controller_spec.rb

require 'rails_helper'

RSpec.describe RecipesController, type: :controller do
  let(:user) { User.create!(name: 'Test User', email: 'test@example.com', password: 'password') }
  let(:valid_attributes) { { name: 'Test Recipe', description: 'Test Description', preparation_time: 30, cooking_time: 60, user_id: user.id } }

  before do
    sign_in user
  end

  describe 'GET #index' do
    it 'renders the index template' do
      get :index
      expect(response).to render_template(:index)
    end
  end

  # ... (similar tests for new, create, update, destroy, etc.)
end

