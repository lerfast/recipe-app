# spec/helpers/recipes_helper_spec.rb
require 'rails_helper'

RSpec.describe RecipesHelper, type: :helper do
  describe "#public_recipe?" do
    it "returns true if the recipe is public" do
      recipe = create(:recipe, public: true)
      expect(helper.public_recipe?(recipe)).to be true
    end
  end
end
