# coding: utf-8

class Blog::ArchivesController < ApplicationController
  include CacheMethods
  before_action :get_latest_posts

  def index
    @blog_posts = BlogPost.published
  end

  def show
    @blog_post = BlogPost.find_by_param params[:id]
    @comment = Comment.new
  end

  def create_comment
    @comment = Comment.new(comment_params)
    @comment.blog_post = BlogPost.find(params[:blog_id])
    @comment.request = request
    if @comment.save
      flash[:notice] = 'Comment posted!'
      redirect_to "#{blog_archive_path(@comment.blog_post)}#comments"
    else
      @blog_post = BlogPost.find_by_param params[:id]
      flash[:error] = 'Please fix the errors and try again'
      render "show"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:name, :email, :website, :comment)
  end
end
