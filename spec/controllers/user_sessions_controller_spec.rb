require 'rails_helper'

describe UserSessionsController do
  describe '#create' do
    it 'rejects a user with invalid credentials' do
      user = create(:user)
      post(:create, user_session: { login: user.login, password: 'invalid' })
      expect(response).to render_template(:new)
      expect(flash[:error]).to eq('Bad credentials, man!')
    end

    it 'creates a session for a user with valid credentials' do
      user = create(:user)
      post(:create, user_session: { login: user.login,
                                    password: user.password })
      expect(response).to redirect_to '/admin'
      expect(flash[:notice]).to eq('Login successful!')
    end
  end
end
