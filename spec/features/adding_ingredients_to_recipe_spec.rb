# spec/features/adding_ingredients_to_recipe_spec.rb

require 'rails_helper'

RSpec.describe 'Adding ingredients to a recipe', type: :feature do
  let!(:user) { User.create!(name: 'Test User', email: 'test@example.com', password: 'password') }
  let!(:recipe) { Recipe.create!(name: 'Test Recipe', user: user) }
  let!(:food) { Food.create!(name: 'Test Food', measurement_unit: 'kg', price: 5, user: user) }

  before do
    sign_in user
    visit recipe_path(recipe)
  end

  scenario 'User adds ingredient to a recipe' do
    click_link 'Add Ingredient'

    select 'Test Food', from: 'Food'
    fill_in 'Quantity', with: 2

    click_button 'Create Recipe food'

    expect(page).to have_content('Ingredient was successfully added.')
    expect(page).to have_content('Test Food')
    expect(page).to have_content('2 kg')
  end
end
