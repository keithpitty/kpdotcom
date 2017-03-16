Kpdotcom::Application.configure do
  config.cache_classes = true
  config.consider_all_requests_local = false
  config.action_controller.perform_caching             = true
  config.active_support.deprecation = :notify
  config.eager_load = true
  config.log_level = :info
  config.force_ssl = true

  # Disable Rails's static asset server (Apache or nginx will already do this)
  config.serve_static_files = false

  # Compress JavaScripts and CSS
  config.assets.compress = true

  # Don't fallback to assets pipeline if a precompiled asset is missed
  config.assets.compile = false

  # Generate digests for assets URLs
  config.assets.digest = true

  # Precompile additional assets
  config.assets.precompile += %w( application-ie.css )

  # Configure AWS variables for paperclip
  config.paperclip_defaults = {
    storage: :s3,
    s3_credentials: {
      bucket: ENV['S3_BUCKET_NAME'],
      access_key_id: ENV['AWS_ACCESS_KEY_ID'],
      secret_access_key: ENV['AWS_SECRET_ACCESS_KEY']
    }
  }

  # Configure memcachier
  config.cache_store =  :dalli_store,
                        (ENV["MEMCACHIER_SERVERS"] || "").split(","),
                        { :username => ENV["MEMCACHIER_USERNAME"],
                          :password => ENV["MEMCACHIER_PASSWORD"],
                          :failover => true,
                          :socket_timeout => 1.5,
                          :socket_failure_delay => 0.2
                        }
end
