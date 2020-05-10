FactoryBot.define do
  factory :blog_post do
    title { 'Test post' }
    post { 'testing...' }
    published { true }
    comments_open { true }
    param { '2014-12-01-test-post' }
  end

  factory :user do
    login { 'someone@example.com' }
    password { 'password' }
  end
end
