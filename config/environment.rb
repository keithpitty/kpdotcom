# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Kpdotcom::Application.initialize!

# Bootstrap the Rails environment, frameworks, and default configuration
require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|

  # Add additional load paths for your own custom dirs
  config.autoload_paths += %W( #{RAILS_ROOT}/app/sweepers )

  config.action_controller.session = {
    :session_key => '_kpdotcom_session',
    :secret      => '1be0c3c6354399c6274a2907772f4a0d8c08214e35057b18e42372098c439f4402b50bf477efe9073dd4749dcf747230d9535fc4ca5c7a1a697a0c1946d5ffe3'
  }

  # Activate observers that should always be running
  config.active_record.observers = :contact_observer, :comment_observer

  config.time_zone = 'Sydney'
  
end