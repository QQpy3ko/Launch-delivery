class Api::Outer::OrdersController < ActionController::API

  def index
    orders = Order.all
    orders = orders.map do |order|
      { id: order.id, name: order.name }
    end

    render json: { results: orders }.to_json, status: :ok
  end
end