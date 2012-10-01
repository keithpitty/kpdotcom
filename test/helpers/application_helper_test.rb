require "minitest_helper"

describe ApplicationHelper do
  it "converts Textile syntax into HTML" do
    textilize("p. A paragraph").must_equal("<p>A paragraph</p>")
  end
end