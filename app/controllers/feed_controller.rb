# coding: utf-8

class FeedController < ApplicationController

  def index
    @blog_posts = BlogPost.published.limit(15)

    respond_to do |format|
      format.atom { render 'index.atom.builder', :layout => false }
    end

  end

end