# spec/models/food_spec.rb

require 'rails_helper'

RSpec.describe Food, type: :model do
  it 'is valid with a name, measurement unit, price, and quantity' do
    user = User.create!(name: 'Test User', email: 'test@example.com', password: 'password')
    food = user.foods.build(name: 'Test Food', measurement_unit: 'kg', price: 5, quantity: 10)
    expect(food).to be_valid
  end

  it 'is invalid without a name' do
    food = Food.new(name: nil)
    food.valid?
    expect(food.errors[:name]).to include("can't be blank")
  end
end
