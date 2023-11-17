# spec/features/user_sign_in_spec.rb

require 'rails_helper'

RSpec.feature 'User sign in', type: :feature do
  scenario 'User signs in successfully' do
    user = User.create!(name: 'Test User', email: 'test@example.com', password: 'password')
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
    expect(page).to have_content 'Signed in successfully'
  end
end
