# spec/helpers/foods_helper_spec.rb
require 'rails_helper'

RSpec.describe FoodsHelper, type: :helper do
  describe "#format_food_name" do
    it "formats the name of the food correctly" do
      expect(helper.format_food_name("apple")).to eq("Apple - Delicious")
    end
  end
end
