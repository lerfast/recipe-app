# spec/features/viewing_public_recipes_spec.rb

require 'rails_helper'

RSpec.describe 'Viewing public recipes', type: :feature do
  let!(:user) { User.create!(name: 'Test User', email: 'test@example.com', password: 'password') }
  let!(:public_recipe) { Recipe.create!(name: 'Public Recipe', public: true, user: user) }

  scenario 'User views public recipes' do
    visit public_recipes_index_path

    expect(page).to have_content('Public Recipes')
    expect(page).to have_content('Public Recipe')
  end
end
