# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  include AuthenticatedSystem
  # Pick a unique cookie name to distinguish our session data from others'
  session :session_key => '_kpdotcom_session_id'
  
  protected
    def get_tags
      if !fragment_exist? :tag_cloud
        @tags = BlogPost.tag_counts.sort {|x,y| x.name <=> y.name}
      end
    end
    
    def get_latest_posts
      if !fragment_exist? :recent_posts
        @latest_posts = BlogPost.latest_published
      end
    end
end
