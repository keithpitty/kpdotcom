class BlogController < ApplicationController
  before_filter :get_tags, :get_latest_posts
  
  caches_page :index

  def index
    @section = 'blog'
    @blog_posts = BlogPost.latest_published
  end
end
