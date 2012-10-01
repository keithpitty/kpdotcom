# coding: utf-8

class Admin::BlogPostsController < AdminLayoutController

  before_filter :require_user
  cache_sweeper :blog_sweeper, :only => [:create, :update, :destroy]

  def index
    @blog_posts = BlogPost.all
  end

  def new
    @blog_post = BlogPost.new
  end

  def create
    @blog_post = BlogPost.new(params[:blog_post])
    begin
      @blog_post.save!
      flash[:notice] = "Blog post created."
      redirect_to admin_blog_posts_url
    rescue Exception => e
      logger.debug(e.message)
      render :action => "new"
    end

  end

  def edit
    @blog_post = BlogPost.find_by_param(params[:id])
  end

  def update
    @blog_post = BlogPost.find_by_param(params[:id])
    begin
      @blog_post.update_attributes(params[:blog_post])
      flash[:notice] = "Blog post updated."
      redirect_to admin_blog_posts_url
    rescue
      render :action => "edit"
    end

  end

  def destroy
    blog_post = BlogPost.find_by_param(params[:id])
    blog_post.destroy
    redirect_to admin_blog_posts_path
  end

  protected
    def set_section
      @section = "admin_blog_posts"
    end
end