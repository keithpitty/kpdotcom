source 'http://rubygems.org'

ruby "2.6.6"

gem 'rails', '~> 5.2.4'
gem 'jquery-rails', '~> 4.3.5'
gem 'pg', '~> 1.1.4'
gem 'RedCloth', '~> 4.3.2'
gem 'coderay', '~> 1.1.2'
gem 'authlogic', '~> 4.4.2'
gem 'rakismet', '~> 1.5.4'
gem 'less-rails', '~> 4.0.0'
gem 'simple_form', '~> 5.0.2'
gem 'paperclip', '~> 6.1.0'
gem 'aws-sdk'
gem 'dalli', '~> 2.7.10'
gem 'gemoji'
gem 'bootsnap'
gem 'webpacker'

group :development, :test do
  gem 'minitest'
  gem 'pry'
  gem 'pry-doc'
  gem 'pry-byebug'
  gem 'pry-rescue'
  gem 'pry-stack_explorer'
  gem 'awesome_print'
  gem 'rspec-rails'
  gem 'guard-rspec', require: false
  gem 'growl'
  gem 'rake'
  gem 'rails-controller-testing'
end

group :development do
  gem 'guard-ctags-bundler'
end

group :test do
  gem 'capybara'
  gem 'factory_bot_rails'
  gem 'timecop'
  gem 'simplecov', require: false
end

group :staging, :production do
  gem 'rails_12factor'
end

group :production do
  gem 'therubyracer', '~> 0.12.3', :require => 'v8'
  gem 'unicorn'
  gem 'rack-timeout', '~> 0.0.4'
end
