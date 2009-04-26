require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe CommentsController do
  
  before(:each) do
    @blog_post = mock("blog post")
    BlogPost.stub!(:find).and_return(@blog_post)
    @comment = mock("comment")
    Comment.stub!(:new).and_return(@comment)
    @comment.stub!(:blog_post).and_return(@blog_post)
  end

  it "should respond successfully" do
    request.env["HTTP_REFERER"] = "/archives/2008-10-12-test-post"
    @comment.should_receive(:blog_post=).and_return(true)
    @comment.should_receive(:request=).and_return(true)
    @comment.should_receive(:approved?).and_return(true)
    @comment.stub!(:save).and_return(true)
    post 'create', :comment => {:name => "Joe Blow", :email => "jb@example.com", :website => "http://example.com", :comment => "My comment..."}
    response.should be_redirect
  end

end
