source 'http://rubygems.org'

ruby "2.1.5"

gem 'rails', '~> 3.2.18'
gem 'jquery-rails', '~> 2.1.2'
gem 'pg', '~> 0.17.1'
gem 'RedCloth', '~> 4.2.9'
gem 'coderay', '~> 1.0.7'
gem 'authlogic', '~> 3.1.3'
gem 'acts-as-taggable-on', '~> 2.3.3'
gem 'rakismet', '~> 1.3.0'
gem 'less-rails', '~> 2.2.6'
gem 'twitter-bootstrap-rails', '~> 2.2.0'
gem 'simple_form', '~> 2.0.4'
gem 'paperclip', '~> 4.2.0'
gem 'aws-sdk', '~> 1.52.0'

group :assets do
  gem 'sass-rails', '~> 3.2.5'
  gem 'coffee-rails', '~> 3.2.2'
  gem 'uglifier', '~> 1.3.0'
end

group :development, :test do
  gem 'pry', '~> 0.9.10'
  gem 'pry-doc', '~> 0.4.4'
  gem 'awesome_print', '~> 1.0.2'
  gem 'rspec-rails', '~> 3.1.0'
end

group :test do
  gem 'capybara', '~> 2.4.4'
end

group :production do
  gem 'therubyracer', '~> 0.12.1', :require => 'v8'
  gem 'rails_12factor'
  gem 'unicorn'
  gem 'rack-timeout', '~> 0.0.4'
end
