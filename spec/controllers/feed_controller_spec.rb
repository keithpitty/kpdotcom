require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe FeedController do
  integrate_views

  it "should be valid feed" do
    get 'index'
    response.should be_valid_feed
  end

end
