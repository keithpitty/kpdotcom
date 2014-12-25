require 'rails_helper'

describe Admin::BlogPostsController do
  before { mock_user_session }

  describe '#create' do
    it 'shows a preview of a post' do
      post :create, blog_post: { title: 'Test Post',
                                 post: 'Testing',
                                 published: '0',
                                 comments_open: '0',
                                 tag_list: '' },
                    preview_button: 'Preview Blog Post'
      expect(response).to render_template :preview
    end

    it 'saves a post' do
      post :create, blog_post: { title: 'Test Post',
                                 post: 'Testing',
                                 published: '0',
                                 comments_open: '0',
                                 tag_list: '' }
      expect(response).to redirect_to('/admin/blog_posts')
      expect(flash[:notice]).to eq('Blog post created.')
    end
  end

  context 'post exists' do
    let(:blog_post) do
      instance_double('BlogPost', id: 1,
                                  title: 'Test',
                                  post: 'Testing')
    end

    before do
      allow(BlogPost).to receive(:find_by_param).and_return(blog_post)
    end

    describe '#update' do
      it 'updates a post' do
        expect(blog_post).to receive(:update_attributes)
        expect(blog_post).to receive(:save).and_return(true)
        post :update, id: '1', blog_post: { title: 'Test',
                                            post: 'Testing',
                                            published: '1' }
        expect(response).to redirect_to('/admin/blog_posts')
        expect(flash[:notice]).to eq('Blog post updated.')
      end
    end

    describe '#destroy' do
      it 'destroys a post' do
        expect(blog_post).to receive(:destroy)
        post :destroy, id: '1'
        expect(response).to redirect_to('/admin/blog_posts')
        expect(flash[:notice]).to eq('Blog post deleted.')
      end
    end
  end
end
