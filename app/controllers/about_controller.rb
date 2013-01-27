# coding: utf-8

class AboutController < ApplicationController

  caches_page :index

  def index
    @section = 'about'
    @testimonials = Testimonial.all
    @achievements = Achievement.all
  end
end
