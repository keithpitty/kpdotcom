require 'rails_helper'

describe BlogPostsController do
  describe 'GET #show' do
    it 'redirects to blog archives' do
      get :show, id: '1'
      expect(response).to redirect_to('/blog/archives/1')
    end
  end
end
