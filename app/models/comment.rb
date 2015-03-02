# coding: utf-8

class Comment < ActiveRecord::Base
  include Rakismet::Model

  belongs_to :blog_post
  validates_presence_of :name
  validates_presence_of :email
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i,
                              :on => :create,
                              :allow_blank => true
  validates_presence_of :comment
  rakismet_attrs :author => :name,
                 :author_url => :website,
                 :author_email => :email,
                 :content => :comment,
                 :permalink => proc { blog_post.param }
  before_create :check_for_spam
  scope :approved, -> { where(approved: true).order("created_at desc") }
  scope :rejected, -> { where(approved: false).order("created_at desc") }

  def footer_name
    website.blank? ? name : "<a href=\"#{website}\">#{name}</a>"
  end

  def request=(request)
    self.user_ip = request.remote_ip
    self.user_agent = request.env['HTTP_USER_AGENT']
    self.referrer = request.env['HTTP_REFERRER']
  end

  def check_for_spam
    self.approved = !self.spam?
  end

  def mark_as_spam!
    update_attribute(:approved, false)
    self.spam!
  end

  def mark_as_ham!
    update_attribute(:approved, true)
    self.ham!
  end
end
