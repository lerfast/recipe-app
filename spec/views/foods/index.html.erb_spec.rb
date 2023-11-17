# spec/views/foods/index.html.erb_spec.rb
require 'rails_helper'

RSpec.describe "foods/index", type: :view do
  it "renders the index view" do
    assign(:foods, [create(:food), create(:food)])
    render
    expect(rendered).to match /NameOfTheFood/
  end
end
