# spec/helpers/public_recipes_helper_spec.rb
require 'rails_helper'

RSpec.describe PublicRecipesHelper, type: :helper do
  describe "#format_recipe_description" do
    it "formats the recipe description correctly" do
      expect(helper.format_recipe_description("This is a test recipe")).to eq("Description: This is a test recipe")
    end
  end
end
