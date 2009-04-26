class FeedController < ApplicationController
  
  def index
    @blog_posts = BlogPost.latest_published(15)
    
    respond_to do |format|
      format.atom
    end
    
  end
  
end
