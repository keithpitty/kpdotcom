require 'rails_helper'

describe Admin::TestimonialsController do
  before { mock_user_session }

  describe '#create' do
    it 'creates a testimonial' do
      post :create, testimonial: { rank: '10',
                                   provider_name: 'Joe Bloggs',
                                   provider_position: 'Developer',
                                   recommendation: 'Knows his stuff.' }
      expect(response).to redirect_to('/admin/testimonials')
      expect(flash[:notice]).to eq('Testimonial created.')
    end
  end

  context 'testimonial exists' do
    let(:testimonial) do
      instance_double('Testimonial', id: 1,
                                     rank: 10,
                                     provider_name: 'Joe Bloggs',
                                     provider_position: 'Developer',
                                     recommendation: 'Knows his stuff.')
    end

    before do
      expect(Testimonial).to receive(:find).and_return(testimonial)
    end

    describe '#update' do
      it 'updates a testimonial' do
        expect(testimonial).to receive(:update_attributes)
        expect(testimonial).to receive(:save).and_return(true)
        post :update, testimonial: { id: '1',
                                     rank: '10',
                                     provider_name: 'Joe Bloggs',
                                     provider_position: 'Developer',
                                     recommendation: 'Knows his stuff.' }
        expect(response).to redirect_to('/admin/testimonials')
        expect(flash[:notice]).to eq('Testimonial updated.')
      end
    end

    describe '#destroy' do
      it 'destroys a testimonial' do
        expect(testimonial).to receive(:destroy).and_return(true)
        post :destroy, id: 1
        expect(response).to redirect_to('/admin/testimonials')
        expect(flash[:notice]).to eq('Testimonial deleted.')
      end
    end
  end
end
