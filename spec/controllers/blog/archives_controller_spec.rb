require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe Blog::ArchivesController do

  before(:each) do
    @blog_post = mock("blog_post")
    BlogPost.stub!(:find_by_param).and_return(@blog_post)
    @comment = mock("comment")
    Comment.stub!(:new).and_return(@comment)
  end

  it "should respond successfully to show" do
    get 'show', :id => "1"
    response.should be_success
    assigns[:blog_post].should == @blog_post
    assigns[:comment].should == @comment
  end

end
