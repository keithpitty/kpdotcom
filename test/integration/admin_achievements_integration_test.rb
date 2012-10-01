require "minitest_helper"

describe "Admin achievements integration" do
  it "shows achievements" do
    create(:user)
    create(:achievement, rank: 1, heading: 'Achievement 1')
    create(:achievement, rank: 2, heading: 'Achievement 2')
    login
    visit admin_achievements_path
    page.text.must_include 'Achievement 1'
    page.text.must_include 'Achievement 2'
  end
end