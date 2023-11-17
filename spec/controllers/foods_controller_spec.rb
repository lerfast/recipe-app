# spec/controllers/foods_controller_spec.rb
require 'rails_helper'

RSpec.describe FoodsController, type: :controller do
  let(:user) { create(:user) }
  before { sign_in user }
  let(:valid_attributes) { attributes_for(:food) }
  let(:invalid_attributes) { { name: '', measurement_unit: '', price: -1, quantity: -1 } }

  before do
    sign_in user
  end

  describe "GET #index" do
    it "renders the index template" do
      get :index
      expect(response).to be_successful
      expect(response).to render_template('index')
    end
  end

  describe "GET #new" do
    it "renders the new template" do
      get :new
      expect(response).to be_successful
      expect(response).to render_template('new')
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Food" do
        expect {
          post :create, params: { food: valid_attributes }
        }.to change(Food, :count).by(1)
      end

      it "redirects to the foods list" do
        post :create, params: { food: valid_attributes }
        expect(response).to redirect_to(foods_path)
      end
    end

    context "with invalid params" do
      it "does not create a new Food" do
        expect {
          post :create, params: { food: invalid_attributes }
        }.to change(Food, :count).by(0)
      end

      it "renders the 'new' template" do
        post :create, params: { food: invalid_attributes }
        expect(response).to be_successful
        expect(response).to render_template('new')
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested food" do
      food = user.foods.create! valid_attributes
      expect {
        delete :destroy, params: { id: food.id }
      }.to change(Food, :count).by(-1)
    end

    it "redirects to the foods list" do
      food = user.foods.create! valid_attributes
      delete :destroy, params: { id: food.id }
      expect(response).to redirect_to(foods_path)
    end
  end
end
