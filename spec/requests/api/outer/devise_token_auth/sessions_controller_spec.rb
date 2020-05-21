require 'rails_helper'

describe 'Whether access is ocurring properly', type: :request do

    it 'for a admin with correct password gives an authentication code' do
      admin = FactoryBot.create(:admin)
      post api_outer_user_session_path, params:  { email: admin.email, password: admin.password }.to_json,
                                  headers: { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
      expect(response.has_header?('access-token')).to eq(true)
    end

end