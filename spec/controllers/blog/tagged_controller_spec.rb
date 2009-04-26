require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe Blog::TaggedController do

  before(:each) do
    @blog_post_1 = mock("blog post 1")
    @blog_post_2 = mock("blog post 2")
    @blog_posts = [@blog_post_1, @blog_post_2]
  end

  it "should display all posts for a given tag" do
    BlogPost.stub!(:find_published_tagged_with).with("A tag").and_return([@blog_post_2])
    get 'index', :tag => "A tag"
    response.should be_success
    assigns[:blog_posts].should == [@blog_post_2]
  end

end
