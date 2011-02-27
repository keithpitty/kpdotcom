class BlogController < ApplicationController
  before_filter :get_tags, :get_latest_posts

  def index
    @section = 'blog'
    @blog_posts = BlogPost.published.limit(5)
  end
end
