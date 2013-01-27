# coding: utf-8

class Testimonial < ActiveRecord::Base
  default_scope order: 'rank ASC'
  validates_presence_of :rank
  validates_numericality_of :rank
  validates_presence_of :provider_name
  validates_presence_of :provider_position
  validates_presence_of :recommendation

  def provider
    "#{provider_name}, #{provider_position}"
  end
end
