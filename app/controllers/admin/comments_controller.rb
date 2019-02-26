module Admin
  # Public: Controller for administration of comments.
  # Facilitates approval, rejection and removal of comments.
  class CommentsController < AdminLayoutController
    include CacheMethods
    before_action :require_user

    def index
      @rejected_comments = Comment.rejected
      @approved_comments = Comment.approved
    end

    def destroy_multiple
      expire_fragment_caches_multiple(params[:comment_ids])
      Comment.destroy(params[:comment_ids])
      flash[:notice] = 'Comments deleted.'
      redirect_to admin_comments_path
    end

    def approve
      @comment = Comment.find(params[:id])
      @comment.mark_as_ham!
      expire_fragment_caches_for_comment
      flash[:notice] = 'Comment approved.'
      redirect_to admin_comments_path
    end

    def reject
      @comment = Comment.find(params[:id])
      @comment.mark_as_spam!
      expire_fragment_caches_for_comment
      flash[:notice] = 'Comment rejected.'
      redirect_to admin_comments_path
    end

    private

    def expire_fragment_caches_multiple(comment_ids)
      comment_ids.each do |id|
        @comment = Comment.find(id.to_i)
        expire_fragment_caches_for_comment
      end
    end
  end
end
