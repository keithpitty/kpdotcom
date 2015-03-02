module CacheMethods
  def expire_fragment_caches_for_comment
    expire_fragment "blog_post_in_list_#{@comment.blog_post.id}"
    expire_fragment "comments_for_blog_post_#{@comment.blog_post.id}"
  end
end
