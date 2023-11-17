# spec/models/recipe_spec.rb

require 'rails_helper'

RSpec.describe Recipe, type: :model do
  it 'is valid with a name, description, and user' do
    user = User.create!(name: 'Test User', email: 'test@example.com', password: 'password')
    recipe = user.recipes.build(name: 'Test Recipe', description: 'Test Description')
    expect(recipe).to be_valid
  end

  it 'is invalid without a name' do
    recipe = Recipe.new(name: nil)
    recipe.valid?
    expect(recipe.errors[:name]).to include("can't be blank")
  end
end
