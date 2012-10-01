# coding: utf-8

class Testimonial < ActiveRecord::Base
  default_scope order: 'rank ASC'
  
  def provider
    "#{provider_name}, #{provider_position}"
  end
end
