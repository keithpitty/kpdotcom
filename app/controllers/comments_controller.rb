class CommentsController < ApplicationController
  
  cache_sweeper :comment_sweeper
  
  def create
    @comment = Comment.new(params[:comment])
    @comment.blog_post = BlogPost.find(params[:blog_id])
    @comment.request = request
    if @comment.save
      if @comment.approved?
        flash[:notice] = "Thanks for your comment."
      else
        flash[:notice] = "Unfortunately this comment is considered spam by Akismet. If it is not spam it will show up once it has been approved by the administrator."
      end
      redirect_to "#{blog_post_path(@comment.blog_post)}#comments"
    else
      render
    end
  end
end
