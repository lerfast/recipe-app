require 'rails_helper'
include Warden::Test::Helpers

RSpec.feature 'Food management', type: :feature do
  given(:user) { User.create!(name: 'Test User', email: 'test@example.com', password: 'password', password_confirmation: 'password') }

  background do
    login_as(user, scope: :user)
  end

  scenario 'User adds a new food item' do
    visit new_food_path
expect(page).to have_selector("input[id=food_name]")
fill_in 'food_name', with: 'Banana'

    fill_in 'Measurement unit', with: 'kg'
    fill_in 'Price', with: '0.5'
    click_button 'Create Food'

    expect(page).to have_content 'Food was successfully created.'
    expect(page).to have_content 'Banana'
  end
end
