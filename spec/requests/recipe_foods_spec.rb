# spec/requests/recipe_foods_spec.rb
require 'rails_helper'

RSpec.describe "RecipeFoods", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get recipe_foods_path
      expect(response).to have_http_status(:success)
    end
  end
end
