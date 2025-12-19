require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  let(:user) { create(:user) }

  describe 'POST #create' do
    before { sign_in user } # Assuming Devise
    it 'creates post' do
      post :create, params: { post: { title: 'Test', content: 'Body' } }
      expect(response).to have_http_status(:created)
    end
  end
end
