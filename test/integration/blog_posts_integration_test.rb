require "minitest_helper"

describe "Blog posts integration" do
  it "shows blog post's title and text" do
    blog_post = create(:blog_post, title: 'Blog Post Title', post: 'Some text')
    visit blog_archive_path(blog_post)
    page.text.must_include 'Blog Post Title'
    page.text.must_include 'Some text'
  end
end