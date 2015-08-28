source 'http://rubygems.org'

ruby "2.2.3"

gem 'rails', '~> 4.2.4'
gem 'jquery-rails', '~> 4.0.3'
gem 'pg', '~> 0.18.1'
gem 'RedCloth', '~> 4.2.9'
gem 'coderay', '~> 1.1.0'
gem 'authlogic', '~> 3.4.4'
gem 'acts-as-taggable-on', '~> 3.4.4'
gem 'rakismet', '~> 1.5.0'
gem 'less-rails', '~> 2.7.0'
gem 'twitter-bootstrap-rails', '~> 2.2.0'
gem 'simple_form', '~> 3.1.0'
gem 'paperclip', '~> 4.2.1'
gem 'aws-sdk', '~> 1.63'
gem 'sass-rails', '~> 5.0.3'
gem 'coffee-rails', '~> 4.1.0'
gem 'uglifier', '~> 1.3.0'
gem 'dalli', '~> 2.7.2'

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
end

group :development do
  gem 'guard-ctags-bundler'
end

group :test do
  gem 'capybara'
  gem 'factory_girl_rails'
  gem 'timecop'
  gem "codeclimate-test-reporter", require: nil
end

group :staging, :production do
  gem 'rails_12factor'
end

group :production do
  gem 'therubyracer', '~> 0.12.1', :require => 'v8'
  gem 'unicorn'
  gem 'rack-timeout', '~> 0.0.4'
end
