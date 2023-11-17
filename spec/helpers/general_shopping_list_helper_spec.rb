# spec/helpers/general_shopping_list_helper_spec.rb
require 'rails_helper'

RSpec.describe GeneralShoppingListHelper, type: :helper do
  describe "#calculate_total_cost" do
    it "calculates the total cost of the shopping list" do
      shopping_list = [create(:food, price: 5), create(:food, price: 10)]
      expect(helper.calculate_total_cost(shopping_list)).to eq(15)
    end
  end
end
