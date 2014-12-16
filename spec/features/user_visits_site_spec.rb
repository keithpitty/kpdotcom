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
end
