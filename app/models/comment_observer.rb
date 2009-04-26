class CommentObserver < ActiveRecord::Observer
  def after_create(comment)
    CommentMailer.deliver_comment(comment) if comment.approved?
  end
end
