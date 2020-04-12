# coding: utf-8

class BlogController < ApplicationController
  before_action :get_latest_posts

  def index
    redirect_to blog_archive_path(BlogPost.published.first)
  end
end
