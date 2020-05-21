class Api::Outer::OrdersController < ActionController::API

  def index
    @orders = Order.where(created_at: Date.today.midnight..Date.today.end_of_day).ordered

    render json: @orders
  end
end
