source 'http://rubygems.org'

ruby "2.4.5"

gem 'rails', '~> 5.2.2'
gem 'jquery-rails', '~> 4.3.3'
gem 'pg', '~> 0.18.1'
gem 'RedCloth', '~> 4.3.2'
gem 'coderay', '~> 1.1.0'
gem 'authlogic', '~> 4.4.2'
gem 'rakismet', '~> 1.5.0'
gem 'less-rails', '~> 4.0.0'
gem 'twitter-bootstrap-rails', '~> 2.2.0'
gem 'simple_form', '~> 4.1.0'
gem 'paperclip', '~> 6.1.0'
gem 'aws-sdk'
gem 'sass-rails', '~> 5.0.7'
gem 'coffee-rails', '~> 4.2.2'
gem 'uglifier', '~> 2.7'
gem 'dalli', '~> 2.7.2'
gem 'gemoji'
gem 'bootsnap'

group :development, :test do
  gem 'minitest'
  gem 'pry'
  gem 'pry-doc'
  gem 'pry-byebug'
  gem 'pry-rescue'
  gem 'pry-stack_explorer'
  gem 'awesome_print'
  gem 'rspec-rails'
  gem 'guard-rspec'
  gem 'growl'
  gem 'rake', '< 11.0'
  gem 'rails-controller-testing'
end

group :development do
  gem 'guard-ctags-bundler'
end

group :test do
  gem 'capybara'
  gem 'factory_bot_rails'
  gem 'timecop'
  gem "codeclimate-test-reporter", require: nil
end

group :staging, :production do
  gem 'rails_12factor'
end

group :production do
  gem 'therubyracer', '~> 0.12.3', :require => 'v8'
  gem 'unicorn'
  gem 'rack-timeout', '~> 0.0.4'
end
