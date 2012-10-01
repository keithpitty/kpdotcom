ENV["Rails.env"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'minitest/autorun'
require 'capybara/rails'
require 'active_support/testing/setup_and_teardown'
require 'turn/autorun'
require 'factory_girl_rails'

class MiniTest::Unit::TestCase
  include FactoryGirl::Syntax::Methods
end

class IntegrationTest < MiniTest::Spec
  include Rails.application.routes.url_helpers
  include Capybara::DSL
  register_spec_type(/integration$/, self)
end

class HelperTest < MiniTest::Spec
  include ActiveSupport::Testing::SetupAndTeardown
  include ActionView::TestCase::Behavior
  register_spec_type(/helper$/, self)
end
