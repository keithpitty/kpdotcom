# coding: utf-8

class Service < ActiveRecord::Base
  def to_param
    name
  end
end
