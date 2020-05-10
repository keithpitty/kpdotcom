require 'rails_helper'

feature 'Admin adds blog post' do
  background do
    create(:user,
           login: 'admin',
           password: 'password')
  end

  scenario 'they add and save a blog post' do
    visit '/admin'
    fill_in 'Login', with: 'admin'
    fill_in 'Password', with: 'password'
    click_button 'Log in'
    expect(page).to have_content("Login successful!")
    click_link 'Blog posts'
    click_link 'Add blog post'
    fill_in 'Title', with: 'Test Post'
    fill_in 'Post', with: 'Testing...'
    click_button 'Save Blog Post'
    expect(page).to have_content('Test Post')
    expect(page).to have_content('Draft')
  end
end
