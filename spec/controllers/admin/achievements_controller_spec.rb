require 'rails_helper'

describe Admin::AchievementsController do
  before { mock_user_session }

  describe '#create' do
    it 'should create an achievement' do
      post :create, params: { achievement: { rank: '1',
                                             heading: 'CEO, Pitty Enterprises',
                                             description: 'Directed proceedings.' } }
      expect(response).to redirect_to('/admin/achievements')
      expect(flash[:notice]).to eq('Achievement created.')
    end
  end

  context 'achievement exists' do
    let(:achievement) do
      instance_double('Achievement', id: 1,
                                     rank: 10,
                                     heading: 'CEO, Pitty Enterprises',
                                     description: 'Directed proceedings.')
    end

    before do
      allow(Achievement).to receive(:find).and_return(achievement)
    end

    describe '#update' do
      it 'should update an achievement' do
        expect(achievement).to receive(:update)
        expect(achievement).to receive(:save).and_return(true)
        post :update, params: {
                                id: '1', achievement: { rank: '10',
                                heading: 'CEO, Pitty Ent.',
                                description: 'Directed stuff.' }
                              }
        expect(response).to redirect_to('/admin/achievements')
        expect(flash[:notice]).to eq('Achievement updated.')
      end
    end

    describe '#destroy' do
      it 'should destroy an achievement' do
        expect(Achievement).to receive(:destroy)
        post :destroy, params: { id: '1' }
        expect(response).to redirect_to('/admin/achievements')
        expect(flash[:notice]).to eq('Achievement deleted.')
      end
    end
  end
end
