require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Contact do
  before(:each) do
    @valid_attributes = {
      :name => "Joe Blow",
      :email => "joe@blow.com",
      :subject => "Mega project",
      :message => "I have a million bucks to spend for a website!"
    }
  end

  it "should create a new instance given valid attributes" do
    Contact.create!(@valid_attributes)
  end
end
