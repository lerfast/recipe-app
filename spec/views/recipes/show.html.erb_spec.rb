# spec/views/recipes/show.html.erb_spec.rb
require 'rails_helper'

RSpec.describe "recipes/show", type: :view do
  before do
    @recipe = assign(:recipe, create(:recipe))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match /name of recipe/
    expect(rendered).to match /recipe description/
  end
end
