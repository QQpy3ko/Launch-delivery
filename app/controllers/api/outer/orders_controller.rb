class Api::Outer::OrdersController < ActionController::API

  def index
    @orders = Order.where(created_at: Date.today.midnight..Date.today.end_of_day).order("id desc")

    @orders = @orders.map do | o |
      items = {items: {}}
      o.menu_items.order("category_id ASC").each do |item|
      items[:items] = items[:items].merge({item.title => ItemHistory.where("menu_item_id = ?", item.id).
                                                          where("created_at < ?", o.created_at).last.price})
      end
      o.attributes.merge(items)
    end

    render json: @orders
  end
end
