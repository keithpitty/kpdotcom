class HomeController < ApplicationController
  before_filter :get_latest_posts, :require_no_user

  def index
    @section = 'home'
    @show_detail = false
  end
  
  def toggle_detail
    @show_detail = params[:show_or_hide] == 'Show more ...' 
    render :partial => 'approach'
  end
end
