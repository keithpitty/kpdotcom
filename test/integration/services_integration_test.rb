require "minitest_helper"

describe "Services integration" do
  it "displays the Services page" do
    visit services_path
    page.text.must_include 'Services'
  end
end