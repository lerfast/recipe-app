# spec/features/user_registration_spec.rb

require 'rails_helper'

RSpec.describe 'User registration', type: :feature do
  scenario 'User registers successfully' do
    visit new_user_registration_path

    fill_in 'Name', with: 'Test User'
    fill_in 'Email', with: 'test@example.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'

    click_button 'Sign up'

    expect(page).to have_content('Welcome! You have signed up successfully.')
  end
end
