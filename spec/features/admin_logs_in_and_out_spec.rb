require 'rails_helper'

feature 'Admin logs in and out' do
  background do
    create(:user,
           login: 'admin',
           password: 'password',
           password_confirmation: 'password') 
  end

  scenario 'they log in and log out' do
    visit '/admin'
    fill_in 'Login', with: 'admin'
    fill_in 'Password', with: 'password'
    click_button 'Log in'
    expect(page).to have_content("Login successful!")
    expect(page).to have_content("Log out")

    click_link 'Log out'
    expect(page).to have_content("Logout successful!")
    expect(page).to have_content("Enter Credentials")
  end
end
