module Admin
  # Public: Controller for administration of blog posts.
  # Facilitates CRUD and preview actions.
  class BlogPostsController < AdminLayoutController
    before_filter :require_user
    cache_sweeper :blog_sweeper, only: [:create, :update, :destroy]

    def index
      @blog_posts = BlogPost.all
    end

    def new
      @blog_post = BlogPost.new
    end

    def preview
    end

    def create
      @blog_post = BlogPost.new(params[:blog_post])
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
        @blog_post = BlogPost.new(params[:blog_post])
        render :preview
      else
        handle_update
      end
    end

    def destroy
      blog_post = BlogPost.find_by_param(params[:id])
      blog_post.destroy
      flash[:notice] = 'Blog post deleted.'
      redirect_to admin_blog_posts_path
    end

    private

    def handle_create
      if @blog_post.save
        flash[:notice] = 'Blog post created.'
        redirect_to admin_blog_posts_url
      else
        logger.debug(e.message)
        render :new
      end
    end

    def handle_update
      @blog_post = BlogPost.find_by_param(params[:id])
      @blog_post.update_attributes(params[:blog_post])
      if @blog_post.save
        flash[:notice] = 'Blog post updated.'
        redirect_to admin_blog_posts_url
      else
        render :edit
      end
    end
  end
end
