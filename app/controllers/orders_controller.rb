class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    if params[:date]
      @requested_day = Date.parse(params[:date])
      @next_day_for_filter = Date.parse(params[:date]).next_day
    end

    if current_user.try(:admin)
        @order_access = "admin"
        @orders = Order.all
    elsif user_signed_in?
        @order_access = "customer"
        @orders = Order.for_current_customer(current_user.id)
    end
  end
end
