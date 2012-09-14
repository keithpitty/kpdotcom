# coding: utf-8

class Testimonial < ActiveRecord::Base
  def provider
    provider_name + ", " + provider_position
  end
end
