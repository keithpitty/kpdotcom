class FeedController < ApplicationController
  
  def index
    @blog_posts = BlogPost.latest_published(15)
    
    respond_to do |format|
      format.atom { render :action => 'index.atom.builder', :layout => false }
    end
    
  end
  
end
