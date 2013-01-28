# coding: utf-8

class AboutController < ApplicationController

  caches_page :index

  def index
    @testimonials = Testimonial.all
    @achievements = Achievement.all
  end
end
