source 'http://rubygems.org'

ruby "3.0.2"

gem 'rails', '~> 6.1.4'
gem 'jquery-rails', '~> 4.4.0'
gem 'pg', '~> 1.2.3'
gem 'RedCloth', '~> 4.3.2'
gem 'coderay', '~> 1.1.3'
gem 'authlogic'
gem 'rakismet', '~> 1.5.4'
gem 'less-rails', '~> 5.0.0'
gem 'simple_form', '~> 5.1.0'
gem 'paperclip', '~> 6.1.0'
gem 'aws-sdk'
gem 'dalli', '~> 2.7.11'
gem 'gemoji'
gem 'bootsnap'
gem 'webpacker'
gem "scrypt", "~> 3.0"

group :development, :test do
  gem 'minitest'
  gem 'awesome_print'
  gem 'rspec-rails'
  gem 'guard-rspec', require: false
  gem 'rake'
  gem 'rails-controller-testing'
  gem 'webrick'
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
  gem 'rack-timeout', '~> 0.6.0'
end
