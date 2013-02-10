# coding: utf-8

class BlogPostsController < ApplicationController

  def show
    redirect_to blog_archive_path(params[:id])    
  end

end