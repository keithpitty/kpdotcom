require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ContactController do

  it "should respond successfully to get 'index" do
    get 'index'
    response.should be_success
  end
  
  it "should respond successfully to create with completed form" do
    post 'create', :contact => {:name => "Joe Bloggs", :email => "joe@example.com", :subject => "Blah", :message => "blah"}
    response.should be_redirect
    flash[:notice].should == "Message sent!"
  end

end
