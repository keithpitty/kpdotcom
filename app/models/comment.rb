class Comment < ActiveRecord::Base
  belongs_to :blog_post
  validates_presence_of :name
  validates_presence_of :email
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, 
                              :on => :create, 
                              :allow_blank => true
  validates_presence_of :comment
  before_create :check_for_spam
  named_scope :approved, :conditions => {:approved => true}, :order => "created_at"
  named_scope :rejected, :conditions => {:approved => false}, :order => "created_at"
  
  def footer_name
    website.blank? ? name : "<a href=\"#{website}\">#{name}</a>"
  end
  
  def request=(request)
    self.user_ip = request.remote_ip
    self.user_agent = request.env['HTTP_USER_AGENT']
    self.referrer = request.env['HTTP_REFERRER']
  end
  
  def check_for_spam
    self.approved = !Akismetor.spam?(akismet_attributes)
    true
  end
  
  def akismet_attributes
    {
      :key => 'ac7c797a41f0',
      :blog => 'http://keithpitty.com',
      :user_ip => user_ip,
      :user_agent => user_agent,
      :comment_author => name,
      :comment_author_email => email,
      :comment_author_url => website,
      :comment_content => comment
    }
  end
  
  def mark_as_spam!
    update_attribute(:approved, false)
    Akismetor.submit_spam(akismet_attributes)
  end
  
  def mark_as_ham!
    update_attribute(:approved, true)
    Akismetor.submit_ham(akismet_attributes)
  end
  
end
