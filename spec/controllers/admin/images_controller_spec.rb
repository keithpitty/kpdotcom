require 'rails_helper'

describe Admin::ImagesController do
  before { mock_user_session }

  describe '#create' do
    let(:picture) { double('picture') }

    it 'creates an image' do
      expect(Image).to receive(:create)
      post :create, image: { picture: picture }
      expect(response).to redirect_to('/admin/images')
      expect(flash[:notice]).to eq('Image saved.')
    end
  end

  describe '#destroy' do
    let(:image) { double('image') }

    it 'destroys an image' do
      expect(Image).to receive(:find).and_return(image)
      expect(image).to receive(:destroy)
      post :destroy, id: '1'
      expect(response).to redirect_to('/admin/images')
      expect(flash[:notice]).to eq('Image deleted.')
    end
  end
end
