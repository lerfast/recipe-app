# spec/models/recipe_food_spec.rb

require 'rails_helper'

RSpec.describe RecipeFood, type: :model do
  describe 'associations' do
    it { should belong_to(:recipe) }
    it { should belong_to(:food) }
  end

  describe 'validations' do
    it { should validate_numericality_of(:quantity).is_greater_than_or_equal_to(0) }
  end

  context 'with valid attributes' do
    it 'is valid with a quantity, recipe, and food' do
      user = User.create!(name: 'Test User', email: 'test@example.com', password: 'password')
      food = user.foods.create!(name: 'Test Food', measurement_unit: 'kg', price: 5, quantity: 10)
      recipe = user.recipes.create!(name: 'Test Recipe', description: 'Test Description', preparation_time: 30, cooking_time: 60)
      recipe_food = recipe.recipe_foods.build(food: food, quantity: 2)

      expect(recipe_food).to be_valid
    end
  end

  context 'with invalid attributes' do
    it 'is invalid without a quantity' do
      recipe_food = RecipeFood.new(quantity: nil)
      recipe_food.valid?
      expect(recipe_food.errors[:quantity]).to include("can't be blank")
    end
  end
end
