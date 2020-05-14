class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    if params[:date]
      @requested_day = Date.parse(params[:date])
    end

    if current_user.try(:admin)
        @order_access = "admin"
        if @requested_day
          @orders = Order.where(created_at: @requested_day.midnight..@requested_day.end_of_day).order("id desc")
        else
          @orders = Order.all.order("id desc")
        end
    elsif user_signed_in?
        @order_access = "customer"
        @orders = Order.for_current_customer(current_user.id)
    end
  end
end
