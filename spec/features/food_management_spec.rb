# spec/features/food_management_spec.rb

require 'rails_helper'

RSpec.feature 'Food management', type: :feature do
  given(:user) { User.create!(name: 'Test User', email: 'test@example.com', password: 'password', password_confirmation: 'password') }

  background do
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: 'password'
    click_button 'Log in'
  end

  scenario 'User adds a new food item' do
    visit new_food_path
    fill_in 'Name', with: 'Banana'
    fill_in 'Measurement unit', with: 'kg'
    fill_in 'Price', with: '0.5'
    click_button 'Create Food'

    expect(page).to have_content 'Food was successfully created.'
    expect(page).to have_content 'Banana'
  end
end
