require 'simplecov'
SimpleCov.start

require 'capybara/rspec'
require 'factory_bot_rails'

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.include FactoryBot::Syntax::Methods
end

RSpec::Mocks.configuration.allow_message_expectations_on_nil = true

def mock_user_session
  user_session = double('user session')
  user = double('user')
  allow(UserSession).to receive(:find).and_return(user_session)
  allow(user_session).to receive(:user).and_return(user)
end
