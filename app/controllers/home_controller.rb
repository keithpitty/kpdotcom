class HomeController < ApplicationController
  before_filter :get_latest_posts

  def index
    @section = 'home'
    @show_detail = false
  end
end
