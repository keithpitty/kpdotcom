require 'rails_helper'

describe ContactsController do
  describe 'POST #create' do
    context 'when contact is invalid' do
      it 'renders the page with an error' do
        post :create, contact: { name: 'Brian Lara',
                                 email: 'invalid',
                                 subject: 'Shot!',
                                 message: 'Great shot, man!' }
        expect(response).to render_template(:new)
        expect(flash[:error].first).to match(/Email is invalid/)
      end
    end
  end
end
