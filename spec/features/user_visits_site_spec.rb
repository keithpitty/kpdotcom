require 'rails_helper'

feature 'User visits site' do
  scenario 'they visit the home page' do
    visit '/'
    expect(page).to have_css 'h1'
    expect(page).to have_content 'Home'
  end

  scenario 'they visit the blog' do
    visit '/'
    click_link 'Blog'
    expect(page).to have_css 'h2'
    expect(page).to have_content 'Navigation'
    expect(page).to have_css 'h2'
    expect(page).to have_content 'Latest Blog Posts'
  end

  scenario 'they visit the about page' do
    visit '/'
    click_link 'About'
    expect(page).to have_css 'h1'
    expect(page).to have_content 'About me'
  end

  scenario 'they visit the contact page' do
    visit '/'
    click_link 'Contact'
    expect(page).to have_css 'h1'
    expect(page).to have_content 'Contact me'
  end
end
