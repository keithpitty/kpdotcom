class HomeController < ApplicationController
  before_filter :get_latest_posts, :require_no_user

  def index
    @section = 'home'
    @show_detail = false
  end
end
