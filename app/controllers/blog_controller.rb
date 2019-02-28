# coding: utf-8

class BlogController < ApplicationController
  before_action :get_latest_posts

  def index
    @blog_posts = BlogPost.published.limit(5)
  end
end
