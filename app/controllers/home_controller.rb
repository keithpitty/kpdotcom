# coding: utf-8

class HomeController < ApplicationController
  before_action :get_latest_posts

  def index
    @show_detail = false
  end
end
