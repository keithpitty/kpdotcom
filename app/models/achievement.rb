# coding: utf-8

class Achievement < ActiveRecord::Base
  default_scope order: 'rank ASC'
end
