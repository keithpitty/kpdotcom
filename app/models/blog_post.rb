class BlogPost < ActiveRecord::Base
  has_many :comments
  validates_presence_of :title
  validates_presence_of :post
  acts_as_taggable
  scope :published, :conditions => {:published => true}, :order => "created_at desc"
  
  def self.latest_published(amount = 5)
    find :all, :conditions => {:published => true}, :order => "created_at desc", :limit => amount
  end
  
  def self.find_published_tagged_with(tag)
    temp = find_tagged_with(tag)
    temp = temp.select {|post| post.published}
    result = temp.sort {|x,y| y.created_at <=> x.created_at}
  end
  
  def before_create
    self.param = param_from_time(Time.zone.now)
  end
  
  def before_update
    self.param = param_from_time(created_at)
  end
  
  def to_param
    param_from_time(created_at)
  end
  
  def status
    published? ? "Published" : "Draft"
  end
  
  def status=(status)
    status == "Published" ? self.published = true : self.published = false
  end
  
  private
    def param_from_time(time)
      "#{time.to_date.to_formatted_s(:db)}-#{title.downcase.gsub(/\s|\./,"-")}"
    end
end
