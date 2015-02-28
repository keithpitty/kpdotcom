source 'http://rubygems.org'

ruby "2.2.0"

gem 'rails', '~> 4.2.0'
gem 'jquery-rails', '~> 2.1.2'
gem 'pg', '~> 0.17.1'
gem 'RedCloth', '~> 4.2.9'
gem 'coderay', '~> 1.1.0'
gem 'authlogic', '~> 3.4.4'
gem 'acts-as-taggable-on', '~> 3.4.4'
gem 'rakismet', '~> 1.3.0'
gem 'less-rails', '~> 2.2.6'
gem 'twitter-bootstrap-rails', '~> 2.2.0'
gem 'simple_form', '~> 3.1.0'
gem 'paperclip', '~> 4.2.1'
gem 'aws-sdk', '~> 1.52.0'
gem 'sass-rails', '~> 5.0.1'
gem 'coffee-rails', '~> 4.1.0'
gem 'uglifier', '~> 1.3.0'

group :development, :test do
  gem 'pry', '~> 0.10.1'
  gem 'pry-doc', '~> 0.6.0'
  gem 'awesome_print', '~> 1.0.2'
  gem 'rspec-rails', '~> 3.1.0'
  gem 'guard-rspec', '~> 4.5.0'
  gem 'growl', '~> 1.0.3'
end

group :development do
  gem 'guard-ctags-bundler', '~> 1.3.1'
end

group :test do
  gem 'capybara'
  gem 'factory_girl_rails', '~> 4.5.0'
  gem 'timecop', '~> 0.7.1'
  gem "codeclimate-test-reporter", require: nil
end

group :production do
  gem 'therubyracer', '~> 0.12.1', :require => 'v8'
  gem 'rails_12factor'
  gem 'unicorn'
  gem 'rack-timeout', '~> 0.0.4'
end
