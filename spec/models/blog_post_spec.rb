require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe BlogPost do
  before(:each) do
    @valid_attributes = {
      :title => "Relating requirements to automated tests",
      :post => "The idea of a user story became popular in extreme programming..."
    }
  end

  it "should create a new instance given valid attributes" do
    BlogPost.create!(@valid_attributes)
  end
end
