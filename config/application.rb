require_relative 'boot'

require 'rails/all'

if defined?(Bundler)
  Bundler.require *Rails.groups(:assets => %w(development test))
end

module Kpdotcom
  class Application < Rails::Application
    config.session_store = {
      :session_key => '_kpdotcom_session',
      :secret      => '1be0c3c6354399c6274a2907772f4a0d8c08214e35057b18e42372098c439f4402b50bf477efe9073dd4749dcf747230d9535fc4ca5c7a1a697a0c1946d5ffe3'
    }
    config.time_zone = 'Sydney'
    config.encoding = "utf-8"
    config.filter_parameters += [:password]
    config.rakismet.key = 'ac7c797a41f0'
    config.rakismet.url = 'http://keithpitty.com/'
    config.generators do |g|
      g.test_framework :rspec
    end

    # Enable the asset pipeline
    config.assets.enabled = true

    # Version of your assets, change this if you want to expire all your assets
    config.assets.version = '1.0'

    # For Heroku
    config.assets.initialize_on_precompile = false

    # Skip locale validation
    config.i18n.enforce_available_locales = false

    config.active_record.raise_in_transactional_callbacks = true
  end
end
