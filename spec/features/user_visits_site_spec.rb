require 'rails_helper'

feature 'User visits site' do
  scenario 'they visit the home page' do
    visit '/'
    expect(page).to have_css 'h1', 'Home'
  end
end
