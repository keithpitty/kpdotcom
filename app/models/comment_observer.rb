# coding: utf-8

class CommentObserver < ActiveRecord::Observer
  def after_create(comment)
    CommentMailer.comment(comment).deliver if comment.approved?
  end
end
