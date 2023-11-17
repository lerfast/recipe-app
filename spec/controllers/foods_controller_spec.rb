# spec/controllers/foods_controller_spec.rb

require 'rails_helper'

RSpec.describe FoodsController, type: :controller do
  let(:user) { User.create!(name: 'Test User', email: 'test@example.com', password: 'password') }
  let(:valid_attributes) { { name: 'Apple', measurement_unit: 'kg', price: 5, quantity: 10, user_id: user.id } }

  before do
    sign_in user
  end

  describe 'GET #index' do
    it 'renders the index template' do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe 'GET #new' do
    it 'renders the new template' do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Food' do
        expect {
          post :create, params: { food: valid_attributes }
        }.to change(Food, :count).by(1)
      end

      it 'redirects to the food list' do
        post :create, params: { food: valid_attributes }
        expect(response).to redirect_to(foods_path)
      end
    end

    context 'with invalid params' do
      it 'does not create a new Food' do
        expect {
          post :create, params: { food: valid_attributes.merge(name: nil) }
        }.to_not change(Food, :count)
      end
    end
  end

  # ... (similar tests for update, destroy, etc.)
end
