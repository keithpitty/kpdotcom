FactoryGirl.define do
  factory :testimonial do
    provider_name { generate(:random_string) }
    provider_position { generate(:random_string) }
  end
end