require "test_helper"

describe Testimonial do
  it "displays provider using name and position" do
    testimonial = create(:testimonial, provider_name: 'Fred Smith', provider_position: 'Director')
    testimonial.provider.must_equal "#{testimonial.provider_name}, #{testimonial.provider_position}"
  end
end