require 'rails_helper'

feature 'User visits site' do
  scenario 'they visit the home page' do
    visit '/'
    expect(page).to have_css 'h1', 'Home'
  end

  scenario 'they visit the services page' do
    visit '/'
    click_link 'Services'
    expect(page).to have_css 'h1', 'Services'
  end

  scenario 'they visit the blog' do
    visit '/'
    click_link 'Blog'
    expect(page).to have_css 'h2', 'Navigation'
    expect(page).to have_css 'h2', 'Latest Blog Posts'
  end

  scenario 'they visit the about page' do
    visit '/'
    click_link 'About'
    expect(page).to have_css 'h1', 'About me'
  end

  scenario 'they visit the contact page' do
    visit '/'
    click_link 'Contact'
    expect(page).to have_css 'h1', 'Contact me'
  end
end
