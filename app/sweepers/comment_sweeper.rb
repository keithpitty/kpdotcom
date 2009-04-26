class CommentSweeper < ActionController::Caching::Sweeper
  observe Comment
  
  def after_save(comment)
    expire_cache_for(comment) if comment.approved?
  end
  
  def after_destroy(comment)
    expire_cache_for(comment)
  end
  
  private
  def expire_cache_for(comment)
    expire_page "/blog.html"
    expire_page blog_archive_path(:id => comment.blog_post.param)
  end
end