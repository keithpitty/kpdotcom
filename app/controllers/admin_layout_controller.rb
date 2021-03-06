# coding: utf-8

class AdminLayoutController < ApplicationController

  before_action :require_user, :except => 'index'

  def index
    redirect_to login_url unless current_user
  end
end
