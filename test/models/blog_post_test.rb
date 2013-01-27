require "minitest_helper"

describe BlogPost do
  it "has param constructed from title and time" do
    blog_post = create(:blog_post, title: 'a title', post: 'some text')
    blog_post.param.must_equal "#{Date.today.strftime('%Y-%m-%d')}-a-title"
  end
end