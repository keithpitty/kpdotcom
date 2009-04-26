class Blog::ArchivesController < ApplicationController
  before_filter :get_tags, :set_section, :get_latest_posts
  
  caches_page :index, :show
  
  def index
    @blog_posts = BlogPost.published
  end
  
  def show
    @blog_post = BlogPost.find_by_param params[:id]
    @comment = Comment.new
  end

  private
    def set_section
      @section = 'blog'
    end
  
end
