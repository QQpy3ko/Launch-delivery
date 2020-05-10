require 'rails_helper'

RSpec.describe "MenuItems", type: :request do

  describe "GET /create" do
    it "returns http success" do
      get "/menu_items/create"
      expect(response).to have_http_status(:success)
    end
  end

end
