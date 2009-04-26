require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe BlogController do
  
  before(:each) do
    @blog_post_1 = mock("blog post 1")
    @blog_post_2 = mock("blog post 2")
    @blog_posts = [@blog_post_1, @blog_post_2]
  end

  it "should display recent posts in response to get 'index'" do
    BlogPost.stub!(:latest_published).and_return(@blog_posts)
    get 'index'
    response.should be_success
    assigns[:blog_posts].should == @blog_posts
  end

end
