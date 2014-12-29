module Admin
  # Public: Controller for administration of comments.
  # Facilitates approval, rejection and removal of comments.
  class CommentsController < AdminLayoutController
    before_filter :require_user

    cache_sweeper :comment_sweeper, only: [:destroy_multiple, :approve, :reject]

    def index
      @rejected_comments = Comment.rejected
      @approved_comments = Comment.approved
    end

    def destroy_multiple
      Comment.destroy(params[:comment_ids])
      flash[:notice] = 'Comments deleted.'
      redirect_to admin_comments_path
    end

    def approve
      @comment = Comment.find(params[:id])
      @comment.mark_as_ham!
      flash[:notice] = 'Comment approved.'
      redirect_to admin_comments_path
    end

    def reject
      @comment = Comment.find(params[:id])
      @comment.mark_as_spam!
      flash[:notice] = 'Comment rejected.'
      redirect_to admin_comments_path
    end
  end
end
