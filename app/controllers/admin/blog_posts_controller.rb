module Admin
  # Public: Controller for administration of blog posts.
  # Facilitates CRUD and preview actions.
  class BlogPostsController < AdminLayoutController
    before_action :require_user

    def index
      @blog_posts = BlogPost.draft + BlogPost.published
    end

    def new
      @blog_post = BlogPost.new
    end

    def preview
    end

    def create
      @blog_post = BlogPost.new(blog_post_params)
      if params[:preview_button]
        render :preview
      else
        handle_create
      end
    end

    def edit
      @blog_post = BlogPost.find_by_param(params[:id])
    end

    def update
      if params[:preview_button]
        @blog_post = BlogPost.new(blog_post_params)
        render :preview
      else
        handle_update
      end
    end

    def destroy
      @blog_post = BlogPost.find_by_param(params[:id])
      @blog_post.destroy
      expire_fragment_caches
      expire_fragment "comments_for_blog_post_#{@blog_post.id}"
      flash[:notice] = 'Blog post deleted.'
      redirect_to admin_blog_posts_path
    end

    private

    def blog_post_params
      params.require(:blog_post).permit(:title, :post, :published, :comments_open, :tag_list)  
    end

    def handle_create
      if @blog_post.save
        expire_fragment_caches
        flash[:notice] = 'Blog post created.'
        redirect_to admin_blog_posts_url
      else
        logger.debug(e.message)
        render :new
      end
    end

    def handle_update
      @blog_post = BlogPost.find_by_param(params[:id])
      @blog_post.update(blog_post_params)
      if @blog_post.save
        expire_fragment_caches
        flash[:notice] = 'Blog post updated.'
        redirect_to admin_blog_posts_url
      else
        render :edit
      end
    end

    def expire_fragment_caches
      expire_fragment "recent_posts"
      expire_fragment "tag_cloud"
      expire_fragment "blog_post_in_list_#{@blog_post.id}"
      expire_fragment "blog_post_detail_#{@blog_post.id}"
    end
  end
end
