# coding: utf-8

class Contact < ActiveRecord::Base
  validates_presence_of :name
  validates_presence_of :email
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create
  validates_presence_of :subject
  validates_presence_of :message
end
