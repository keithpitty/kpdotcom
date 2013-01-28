# coding: utf-8

class Achievement < ActiveRecord::Base
  default_scope order: 'rank ASC'
  validates_presence_of :rank
  validates_numericality_of :rank
  validates_presence_of :heading
  validates_presence_of :description
end
