require 'rails_helper'

describe Api::V1::OrdersController do
  describe '#create' do

  let(:item_1) { FactoryBot.create :menu_item }
  let(:item_2) { FactoryBot.create :menu_item }
  let(:item_3) { FactoryBot.create :menu_item }
  let(:order_params) { { total: 40, menu_ids: [item_1.id, item_2.id, item_3.id] } }

    context "not authorized request" do
      it "returns http 401" do
        post :create, params: {order: order_params}, format: :json
        expect(response).to have_http_status(:unauthorized)
      end
    end

    context "authorized request" do
      login_user

      it "returns status ok" do
        post :create, params: {order: order_params}, format: :json
        expect(response).to have_http_status(:success)
      end
    end
  end
end
