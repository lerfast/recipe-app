# spec/helpers/recipe_foods_helper_spec.rb
require 'rails_helper'

RSpec.describe RecipeFoodsHelper, type: :helper do
  describe "#calculate_total_food_cost" do
    it "calculates the total cost of foods in a recipe" do
      recipe_food1 = create(:recipe_food, quantity: 2, food: create(:food, price: 3))
      recipe_food2 = create(:recipe_food, quantity: 1, food: create(:food, price: 5))
      recipe_foods = [recipe_food1, recipe_food2]

      expect(helper.calculate_total_food_cost(recipe_foods)).to eq(11) # 2*3 + 1*5
    end
  end
end
