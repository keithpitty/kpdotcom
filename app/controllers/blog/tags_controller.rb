# coding: utf-8

class Blog::TagsController < ApplicationController
  before_action :get_tags, :get_latest_posts

  def show
    @blog_posts = BlogPost.find_published_tagged_with(params[:id].gsub("-", " "))
  end

end
