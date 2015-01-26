# coding: utf-8

class BlogPost < ActiveRecord::Base
  default_scope order: 'created_at DESC'
  has_many :comments
  validates_presence_of :title
  validates_presence_of :post
  acts_as_taggable
  scope :published, conditions: { published: true }, order: "published_at DESC"
  before_save :set_published_at, if: :being_published?
  before_save :set_param

  def self.find_published_tagged_with(tag)
    tagged_with(tag).select(&:published).sort { |x, y| y.created_at <=> x.created_at }
  end

  def set_param
    published? ? set_param_from_published_at : set_param_from_now
  end

  def to_param
    param || param_from_time(Time.zone.now)
  end

  def set_published_at
    self.published_at = Time.zone.now
  end

  def status
    published? ? "Published" : "Draft"
  end

  def status=(status)
    status == "Published" ? self.published = true : self.published = false
  end

  private

  def param_from_time(time)
    "#{time.to_date.to_formatted_s(:db)}-#{title.downcase.gsub(/\s|\./, '-').gsub(',', '').sub(/\?$/, '')}"
  end

  def being_published?
    published? && published_at.nil?
  end

  def set_param_from_now
    self.param = param_from_time(Time.zone.now)
  end

  def set_param_from_published_at
    self.param = param_from_time(published_at)
  end
end
