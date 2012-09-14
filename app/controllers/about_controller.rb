# coding: utf-8

class AboutController < ApplicationController

  caches_page :index

  def index
    @section = 'about'
    @testimonials = Testimonial.find :all, :order => 'rank'
    @achievements = Achievement.find :all, :order => 'rank'
  end
end
