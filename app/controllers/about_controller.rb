# coding: utf-8

class AboutController < ApplicationController

  def index
    @testimonials = Testimonial.all
    @achievements = Achievement.all
  end
end
