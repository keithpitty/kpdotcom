# coding: utf-8

class AboutController < ApplicationController

  def index
    @achievements = Achievement.all
  end
end
