Kpdotcom::Application.configure do
  config.cache_classes = false
  config.whiny_nils = true
  config.consider_all_requests_local = true
  config.action_controller.perform_caching             = false
  # config.action_view.cache_template_extensions         = false
  # config.action_view.debug_rjs                         = true
  config.action_mailer.raise_delivery_errors = false
  config.active_support.deprecation = :log

  # Only use best-standards-support built into browsers
  config.action_dispatch.best_standards_support = :builtin

  # Do not compress assets
  config.assets.compress = false

  # Expands the lines which load the assets
  config.assets.debug = true

  config.eager_load = false

  # Configure command path for Paperclip
  Paperclip.options[:command_path] = "/user/local/bin/"
end
