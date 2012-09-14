# coding: utf-8

class CommentMailer < ActionMailer::Base
  default :to => "keith@keithpitty.com"
  
  def comment(comment)
    @comment = comment.comment
    @name = comment.name
    
    mail(:from => comment.email, :subject => "[Comment via keithpitty.com] Re: #{comment.blog_post.title}")
  end
end
