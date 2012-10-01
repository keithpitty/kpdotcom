FactoryGirl.define do
  factory :achievement do
    rank 10
    heading { Faker::Lorem.sentence }
    description { Faker::Lorem.paragraphs }
  end
  factory :blog_post do
    title { Faker::Lorem.sentence }
    post { Faker::Lorem.paragraphs }
  end
  factory :testimonial do
    rank 10
    provider_name { Faker::Name.name }
    provider_position { Faker::Lorem.words }
  end
  factory :user do
    login 'adminuser'
    password 'secret'
    password_confirmation 'secret'
  end
end