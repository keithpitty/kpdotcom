# coding: utf-8

class Blog::ArchivesController < ApplicationController
  include CacheMethods
  before_filter :get_tags, :get_latest_posts

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
      if @comment.approved?
        expire_fragment_caches_for_comment
        CommentMailer.comment(@comment).deliver_now if @comment.approved?
        flash[:notice] = "Thanks for your comment."
      else
        flash[:error] = "Unfortunately this comment is considered spam by Akismet. If it is not spam it will show up once it has been approved by the administrator."
      end
      redirect_to "#{blog_archive_path(@comment.blog_post)}#comments"
    else
      @blog_post = BlogPost.find_by_param params[:id]
      render "show"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:name, :email, :website, :comment)
  end

end
