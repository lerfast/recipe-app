# spec/controllers/users_controller_spec.rb

require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:user) { User.create!(name: 'Test User', email: 'test@example.com', password: 'password') }

  before do
    sign_in user
  end

  describe 'GET #show' do
    it 'renders the show template' do
      get :show, params: { id: user.id }
      expect(response).to render_template(:show)
    end

    it 'assigns @user' do
      get :show, params: { id: user.id }
      expect(assigns(:user)).to eq(user)
    end
  end
end
