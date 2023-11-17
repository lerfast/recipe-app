# spec/views/public_recipes/index.html.erb_spec.rb
require 'rails_helper'

RSpec.describe "public_recipes/index", type: :view do
  it "renders the index page" do
    render
    expect(rendered).to match /some text/
  end
end
