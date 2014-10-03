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

  def preview

  end

  def create
    @blog_post = BlogPost.new(params[:blog_post])
    if params[:preview_button]
      render "preview"
    else
      begin
        @blog_post.save!
        flash[:notice] = "Blog post created."
        redirect_to admin_blog_posts_url
      rescue Exception => e
        logger.debug(e.message)
        render "new"
      end
    end
  end

  def edit
    @blog_post = BlogPost.find_by_param(params[:id])
  end

  def update
    if params[:preview_button]
      @blog_post = BlogPost.new(params[:blog_post])
      render "preview"
    else
      begin
        @blog_post = BlogPost.find_by_param(params[:id])
        @blog_post.update_attributes(params[:blog_post])
        flash[:notice] = "Blog post updated."
        redirect_to admin_blog_posts_url
      rescue
        render "edit"
      end
    end
  end

  def destroy
    blog_post = BlogPost.find_by_param(params[:id])
    blog_post.destroy
    redirect_to admin_blog_posts_path
  end
end
