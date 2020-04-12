# coding: utf-8

class HomeController < ApplicationController
  before_action :get_latest_posts

  def index
    @show_detail = false
    @blog_posts = BlogPost.published.limit(3)
  end
end
