class BlogSweeper < ActionController::Caching::Sweeper
  observe BlogPost
  
  def after_save(post)
    expire_cache_for(post)
  end
  
  def after_destroy(post)
    expire_cache_for(post)
  end
  
  private
  
  def expire_cache_for(record)
    expire_page "/index.html"
    expire_page "/blog.html"
    expire_page blog_archives_path
    expire_page "/blog/archives/#{record.to_param}.html"
    FileUtils.rm_rf File.expand_path("public/blog/tags", RAILS_ROOT)
  end
end