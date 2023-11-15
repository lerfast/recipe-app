class FoodsController < ApplicationController
  def index
    @foods = Food.all
  end

  def shopping_list
    @foods_needed = RecipeFood
      .joins(:food, :recipe)
      .select('foods.*, recipe_foods.quantity AS quantity_needed')
      .where('recipes.user_id = ? AND foods.quantity < recipe_foods.quantity', current_user.id)
      .distinct
  end
end
