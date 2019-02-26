require 'rails_helper'

feature 'User visits blog post' do
  background do
    create(:blog_post, title: 'Test post')
  end

  scenario 'they add a comment' do
    visit '/'
    click_link 'Blog'
    first(:link, 'Test post').click
    fill_in 'Name', with: 'A Tester'
    fill_in 'Email', with: 'a.tester@example.com'
    fill_in 'Comment', with: 'I agree!'
    click_button 'Post Comment'

    expect(page).to have_css('#comments p')
  end
end
