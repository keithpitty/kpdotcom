require 'rails_helper'

feature 'User visits blog post' do
  background do
    create(:blog_post, title: 'Test post')
  end

  scenario 'they add a comment' do
    visit '/'
    click_link 'Blog'
    fill_in 'Name', with: 'A Tester'
    fill_in 'Email', with: 'a.tester@example.com'
    fill_in 'Comment', with: 'I agree!'
    click_button 'Post Comment'

    expect(page).to have_css('#comments p')
  end

  scenario 'they try to add a comment without entering all necessary fields' do
    visit '/'
    click_link 'Blog'
    fill_in 'Name', with: 'A Tester'
    fill_in 'Comment', with: 'I agree!'
    click_button 'Post Comment'

    expect(page).to have_text('Please fix the errors and try again')
  end
end
