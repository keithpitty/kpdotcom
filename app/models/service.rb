# coding: utf-8

class Service < ApplicationRecord
  def to_param
    name
  end
end
