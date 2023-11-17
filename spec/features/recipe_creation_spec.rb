# spec/features/recipe_creation_spec.rb

require 'rails_helper'

RSpec.describe 'Recipe creation', type: :feature do
  let!(:user) { User.create!(name: 'Test User', email: 'test@example.com', password: 'password') }

  before do
    sign_in user
  end

  scenario 'User creates a new recipe' do
    visit new_recipe_path

    fill_in 'Name', with: 'Test Recipe'
    fill_in 'Description', with: 'Test Description'
    fill_in 'Preparation time', with: 10
    fill_in 'Cooking time', with: 20

    click_button 'Create Recipe'

    expect(page).to have_content('Recipe was successfully created.')
    expect(page).to have_content('Test Recipe')
  end
end
