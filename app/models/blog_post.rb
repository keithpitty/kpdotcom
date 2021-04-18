# coding: utf-8

class BlogPost < ApplicationRecord
  has_many :comments
  validates_presence_of :title
  validates_presence_of :post
  scope :published, -> { where(published: true).order("published_at DESC") }
  scope :draft, -> { where(published: false).order("updated_at DESC") }
  before_save :set_published_at, if: :being_published?
  before_save :set_param

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

  def has_previous_post?
    previous_posts.exists?
  end

  def has_next_post?
    future_posts.exists?
  end

  def previous
    previous_posts.first
  end

  def next
    future_posts.last
  end

  private

  def previous_posts
    BlogPost.published.where("published_at < ?", self.published_at)
  end

  def future_posts
    BlogPost.published.where("published_at > ?", self.published_at)
  end

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
