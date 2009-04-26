class CommentMailer < ActionMailer::Base
  def comment(comment)
    @recipients = "keith@keithpitty.com"
    @from = "#{comment.email}"
    @subject = "[Comment via keithpitty.com] Re: #{comment.blog_post.title}"
    @sent_on = Time.now
    @body[:comment] = "#{comment.comment}"
    @body[:name] = "#{comment.name}"
  end
end
