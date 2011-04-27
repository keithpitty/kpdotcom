class BlogSweeper < ActionController::Caching::Sweeper
  observe BlogPost
  
  def after_save(post)
    expire_cache_for(post)
  
  def after_destroy(post)
    expire_cache_for(post)
  end
  
  private
  
  def expire_cache_for(post)
    expire_fragment :recent_posts
    expire_fragment :tag_cloud
    expire_fragment "blog_post_in_list_#{post.id}"
    expire_fragment "blog_post_detail_#{post.id}"
    expire_fragment "comments_for_blog_post_#{post.id}"
  end
end