class HomeController < ApplicationController
  before_filter :get_latest_posts

  caches_page :index

  def index
    @section = 'home'
    @show_detail = false
  end
  
  def toggle_detail
    @show_detail = params[:show_or_hide] == 'Show more ...' 
    render :partial => 'approach'
  end
end
