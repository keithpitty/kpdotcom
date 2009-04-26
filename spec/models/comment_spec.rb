require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Comment do
  before(:each) do
    @valid_attributes = {
      :name => "Joe Blow",
      :email => "jb@example.com",
      :comment => "My comment..."
    }
  end

  it "should be valid with valid attributes" do
    comment = Comment.new(@valid_attributes)
    comment.should be_valid
  end
  
  it "should reject invalid email" do
    comment = Comment.new
    comment.name = "Joe Blow"
    comment.comment = "My comment..."
    comment.email = "invalidemail"
    comment.should_not be_valid
  end
end
