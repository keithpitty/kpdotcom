require 'rails_helper'

describe Admin::CommentsController do
  let(:blog_post) { instance_double(BlogPost, id: 1) }
  let(:comment)   { instance_double(Comment, blog_post: blog_post) }

  before do
    mock_user_session
  end

  describe '#destroy_multiple' do
    it 'destroys multiple comments' do
      allow(Comment).to receive(:find) { comment }
      expect(Comment).to receive(:destroy).and_return(true)
      post :destroy_multiple, comment_ids: %w(1 2)
      expect(response).to redirect_to('/admin/comments')
      expect(flash[:notice]).to eq('Comments deleted.')
    end
  end

  context 'comment exists' do

    before { expect(Comment).to receive(:find).and_return(comment) }

    describe '#approve' do
      it 'marks a comment as approved' do
        expect(comment).to receive(:mark_as_ham!)
        post :approve, id: '1'
        expect(response).to redirect_to('/admin/comments')
        expect(flash[:notice]).to eq('Comment approved.')
      end
    end

    describe '#reject' do
      it 'rejects a comment' do
        expect(comment).to receive(:mark_as_spam!)
        post :reject, id: '1'
        expect(response).to redirect_to('/admin/comments')
        expect(flash[:notice]).to eq('Comment rejected.')
      end
    end
  end
end
