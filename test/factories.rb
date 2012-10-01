FactoryGirl.define do
  factory :blog_post do
    title { generate(:random_string) }
    post { generate(:random_string) }
  end
  factory :testimonial do
    provider_name { generate(:random_string) }
    provider_position { generate(:random_string) }
  end
end