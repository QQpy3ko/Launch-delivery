require 'rails_helper'

RSpec.describe "Orders", type: :request do

  describe "GET /index" do
    context "authorized request"
      it "returns http success" do
        user = FactoryBot.create(:user)
        login_as(user, :scope => :user)
        get "/orders"
        expect(response).to have_http_status(:success)
      end

    context "not authorized request"
      it "returns http found" do
        get "/orders"
        expect(response).to have_http_status(:found)
    end
  end
end
