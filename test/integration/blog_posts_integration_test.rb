require "minitest_helper"

describe "Blog posts integration" do
  it "shows blog post's title and text" do
    blog_post = create(:blog_post, title: 'Blog Post Title', post: 'Some text')
    visit blog_archive_path(blog_post)
    page.text.must_include 'Blog Post Title'
    page.text.must_include 'Some text'
  end

  it "shows the archives page" do
    create(:blog_post, title: 'Blog Post 1', post: 'Some text', published: true)
    create(:blog_post, title: 'Blog Post 2', post: 'Some text', published: true)
    create(:blog_post, title: 'Blog Post 3', post: 'Some text', published: true)
    create(:blog_post, title: 'Blog Post 4', post: 'Some text', published: true)
    create(:blog_post, title: 'Blog Post 5', post: 'Some text', published: true)
    create(:blog_post, title: 'Blog Post 6', post: 'Some text', published: true)
    visit blog_archives_path
    page.text.must_include 'Archives'
    page.text.must_include 'Blog Post 1'
    page.text.must_include 'Blog Post 2'
    page.text.must_include 'Blog Post 3'
    page.text.must_include 'Blog Post 4'
    page.text.must_include 'Blog Post 5'
    page.text.must_include 'Blog Post 6'
  end
end