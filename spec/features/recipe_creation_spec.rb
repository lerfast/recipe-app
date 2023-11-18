# spec/features/recipe_creation_spec.rb

require 'rails_helper'
include Warden::Test::Helpers

RSpec.feature 'Recipe creation', type: :feature do
  let(:user) { create(:user, name: 'Test User', email: 'test@example.com', password: 'password', password_confirmation: 'password') }

  background do
    login_as(user, scope: :user)
    visit new_recipe_path
  end

  scenario 'User creates a new recipe' do
    fill_in 'Name', with: 'Test Recipe'
    fill_in 'Description', with: 'Test Description'
    fill_in 'Preparation time', with: '30'
    fill_in 'Cooking time', with: '60'
    check 'recipe_public'  
    click_button 'Create Recipe'

    
    expect(page).to have_content 'Test Recipe'
  end
end
