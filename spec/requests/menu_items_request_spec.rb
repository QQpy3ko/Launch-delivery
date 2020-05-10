require 'rails_helper'

RSpec.describe "MenuItems", type: :request do

  describe "GET /create" do

    context "non-admin not authorized"
      it "returns http found" do
        user = FactoryBot.create(:user)
        login_as(user, :scope => :user)
        get "/admin/menu_items/create"
        expect(response).to have_http_status(:found)
    end
  end

end
