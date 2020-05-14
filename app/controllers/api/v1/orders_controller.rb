module Api
  module V1
    class  OrdersController < WebApplicationController
      before_action :authenticate_user!

      def create
        @order = Order.new(order_params.merge({user_id: current_user.id,
                                              address: current_user.default_address,
                                              phone: current_user.phone,
                                              name: current_user.name}))

        respond_to do |format|
          if @order.save
            @message = { message_text: 'Order successfully created'}
            format.json { render :create, status: :ok }
          else
            format.json { render :unauthorized, status: 401 }
          end
        end
      end

      def order_params
        params.require(:order).permit(:total, {menu_item_ids: []}, :user_id, :address, :phone, :name)
      end
    end
  end
end
