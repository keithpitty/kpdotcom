require 'rails_helper'

feature 'User visits site' do
  background do
    create(:blog_post, title: 'Test post')
  end

  scenario 'they visit the home page' do
    visit '/'
    expect(page).to have_css 'h1'
    expect(page).to have_content 'Home'
  end

  scenario 'they visit the blog' do
    visit '/'
    click_link 'Blog'
    expect(page).to have_css 'h1'
    expect(page).to have_content 'Test post'
  end

  scenario 'they visit the archives' do
    visit '/'
    click_link 'Archives'
    expect(page).to have_css 'h1'
    expect(page).to have_content 'Archives'
    expect(page).to have_content 'Test post'
  end

  scenario 'they visit the about page' do
    visit '/'
    click_link 'About'
    expect(page).to have_css 'h1'
    expect(page).to have_content 'About me'
  end

  scenario 'they visit the testimonials page' do
    visit '/'
    click_link 'Testimonials'
    expect(page).to have_css 'h1'
    expect(page).to have_content 'Testimonials'
  end

  scenario 'they visit the contact page' do
    visit '/'
    click_link 'Contact'
    expect(page).to have_css 'h1'
    expect(page).to have_content 'Contact me'
  end
end
