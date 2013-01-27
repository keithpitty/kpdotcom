# coding: utf-8

class AdminLayoutController < ApplicationController

  before_filter :require_user, :except => 'index'
  before_filter :set_section

  def index
    redirect_to login_url unless current_user
  end

  protected
    def set_section
      @section = "admin_home"
    end
end