require "minitest_helper"

describe "About integration" do
  it "shows testimonials and achievements" do
    achievement_1 = create(:achievement, rank: 1, heading: 'Achievement 1')
    achievement_2 = create(:achievement, rank: 2, heading: 'Achievement 2')
    testimonial_1 = create(:testimonial, rank: 1, provider_name: 'Richie Benaud')
    testimonial_2 = create(:testimonial, rank: 2, provider_name: 'Ian Chappell')
    visit about_path
    page.text.must_include 'Achievement 1'
    page.text.must_include 'Achievement 2'
    page.text.must_include 'Richie Benaud'
    page.text.must_include 'Ian Chappell'
  end
end