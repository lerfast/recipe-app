# spec/views/general_shopping_list/index.html.erb_spec.rb
require 'rails_helper'

RSpec.describe "general_shopping_list/index", type: :view do
  it "renders the index page" do
    render
    expect(rendered).to match /some text/
  end
end
