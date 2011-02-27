Kpdotcom::Application.configure do
  config.cache_classes = true
  config.action_controller.consider_all_requests_local = false
  config.action_controller.perform_caching             = true
  config.active_support.deprecation = :notify
end
