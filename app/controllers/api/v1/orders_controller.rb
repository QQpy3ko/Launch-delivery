class Api::V1::OrdersController < ApplicationController
  before_action :authenticate_user!

  def create
    @order = Order.new(order_params.merge({user_id: current_user.id, address: current_user.default_address, phone: current_user.phone}))

    respond_to do |format|
      if @order.save
        @message = { message_text: 'Order successfully created'}
        format.json { render status: :ok }
      else
        format.json { render :unauthorized, status: 401 }
      end
    end
  end

  def authorized?
    user_signed_in?
  end

  def handle_unauthorized
    unless authorized?
      respond_to do |format|
        format.json { render :unauthorized, status: 401 }
      end
    end
  end

  def order_params
    params.require(:order).permit(:total, {menu_item_ids: []}, :user_id, :address, :phone)
  end
end
