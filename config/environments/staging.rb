Kpdotcom::Application.configure do
  config.cache_classes = true
  config.consider_all_requests_local = false
  config.action_controller.perform_caching             = true
  config.active_support.deprecation = :notify
  config.eager_load = true

  # Disable Rails's static asset server (Apache or nginx will already do this)
  config.serve_static_files = false

  # Store uploaded files on the local file system (see config/storage.yml for options)
  config.active_storage.service = :amazon

  config.log_level = :debug
end
