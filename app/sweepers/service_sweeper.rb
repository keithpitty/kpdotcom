class ServiceSweeper < ActionController::Caching::Sweeper
  observe Service
  
  def after_save(service)
    expire_cache_for(service)
  end
  
  def after_destroy(service)
    expire_cache_for(service)
  end
  
  private
  
  def expire_cache_for(service)
    FileUtils.rm_rf File.expand_path("public/services", Rails.root)
  end
end