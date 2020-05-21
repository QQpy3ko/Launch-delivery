require 'rails_helper'

describe OrdersController, type: :controller do
  describe '#index' do
    render_views

    context "Orders history for non-admin user " do
      login_user
      let(:order_by_user_1) { FactoryBot.create (:order) }
      let!(:user_2) { create(:user) }
      let(:order_by_user_2) { FactoryBot.create (:order) }

      it "orders by both users are visible" do
        order_by_user_1.user_id = User.first.id
        order_by_user_2.user_id = user_2.id
        get :index

        expect(response.body).to have_content('Orders history')
      end
    end
  end
end
