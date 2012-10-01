# coding: utf-8

class Blog::ArchivesController < ApplicationController
  before_filter :get_tags, :set_section, :get_latest_posts

  cache_sweeper :comment_sweeper, :only => :create_comment

  def index
    @blog_posts = BlogPost.published
  end

  def show
    @blog_post = BlogPost.find_by_param params[:id]
    @comment = Comment.new
  end

  def create_comment
    @comment = Comment.new(params[:comment])
    @comment.blog_post = BlogPost.find(params[:blog_id])
    @comment.request = request
    if @comment.save
      if @comment.approved?
        flash[:notice] = "Thanks for your comment."
        expire_fragment(:fragment => "blog_home")
      else
        flash[:error] = "Unfortunately this comment is considered spam by Akismet. If it is not spam it will show up once it has been approved by the administrator."
      end
      redirect_to "#{blog_archive_path(@comment.blog_post)}#comments"
    else
      @blog_post = BlogPost.find_by_param params[:id]
      render :action => "show"
    end
  end

  private
    def set_section
      @section = 'blog'
    end

end