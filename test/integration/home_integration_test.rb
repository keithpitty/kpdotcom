require "minitest_helper"

describe "Home integration" do
  it "displays the home page" do
    visit '/'
    page.text.must_include 'Home'
    page.text.must_include 'Latest Blog Posts'
  end
end