require "minitest_helper"

describe "Admin blog posts integration" do
  it "shows blog posts" do
    create(:user)
    create(:blog_post, title: 'First Post')
    create(:blog_post, title: 'Another Post')
    login
    visit admin_blog_posts_path
    page.text.must_include 'First Post'
    page.text.must_include 'Another Post'
  end
end