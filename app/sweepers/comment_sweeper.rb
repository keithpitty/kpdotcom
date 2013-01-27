# coding: utf-8

class CommentSweeper < ActionController::Caching::Sweeper
  observe Comment

  def after_save(comment)
    expire_cache_for(comment)
  end

  def after_destroy(comment)
    expire_cache_for(comment)
  end

  private

  def expire_cache_for(comment)
    expire_fragment "blog_post_in_list_#{comment.blog_post.id}"
    expire_fragment "comments_for_blog_post_#{comment.blog_post.id}"
  end
end