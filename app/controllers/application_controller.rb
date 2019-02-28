# coding: utf-8

class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user_session, :current_user

  http_basic_authenticate_with name: ENV['STAGING_NAME'], password: ENV['STAGING_PASSWORD'] if Rails.env == 'staging'

  protected
    def require_user
      unless current_user
        redirect_to('/admin', :notice => "You must be logged in to access this page")
      end
    end

    def require_no_user
      if current_user
        redirect_to(edit_account_url, :notice => "You must be logged out to access this page")
        return false
      end
    end

    def current_user
      return @current_user if defined?(@current_user)
      @current_user = current_user_session && current_user_session.user
    end

    def get_latest_posts
      unless fragment_exist? "recent_posts"
        @latest_posts = BlogPost.published.limit(5)
      end
    end

  private
    def current_user_session
      return @current_user_session if defined?(@current_user_session)
      logger.info "Could not find user session using UserSession.find" unless UserSession.find
      @current_user_session = UserSession.find
    end
end
