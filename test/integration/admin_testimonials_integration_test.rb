require "minitest_helper"

describe "Admin testimonials integration" do
  it "shows testimonials" do
    create(:user)
    create(:testimonial, rank: 1, provider_name: "Richie")
    create(:testimonial, rank: 2, provider_name: "Ian")
    login
    visit admin_testimonials_path
    page.text.must_include "Richie"
    page.text.must_include "Ian"
  end
end