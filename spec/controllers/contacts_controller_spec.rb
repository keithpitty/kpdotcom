require 'rails_helper'

describe ContactsController do
  describe 'POST #create' do
    context 'when contact is invalid' do
      it 'renders the page with an error' do
        post :create, params: {
                                contact: { name: 'Brian Lara',
                                           email: 'invalid',
                                           subject: 'Shot!',
                                           message: 'Great shot, man!' },
                                content: ''
                              }
        expect(response).to render_template(:new)
        expect(flash[:error]).to eq('Please fix the errors and try again.')
      end
    end
    context 'when contact is invalid then valid' do
      it 'renders the page with an error then a success when the error is corrected' do
        post :create, params: {
                                contact: { name: 'Brian Lara',
                                           email: 'invalid',
                                           subject: 'Shot!',
                                           message: 'Great shot, man!' },
                                content: ''
                              }
        expect(response).to render_template(:new)
        expect(flash[:error]).to eq('Please fix the errors and try again.')

        post :create, params: {
                                contact: { name: 'Brian Lara',
                                           email: 'brian@example.com',
                                           subject: 'Shot!',
                                           message: 'Great shot, man!' },
                                content: ''
                              }
        expect(response).to be_redirect
        expect(flash[:notice]).to eq('Message sent!')
      end
    end
  end
end
