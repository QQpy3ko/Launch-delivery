class OrderSerializer < ActiveModel::Serializer
  attributes :id, :total, :user_id, :name, :address, :phone, :created_at, :menu_items

  def menu_items
    items = {items: {}}
    object.menu_items.order("category_id ASC").each do |item|
      items[:items] = items[:items].merge({item.title => ItemHistory.where("menu_item_id = ?", item.id).
                                                          where("created_at < ?", object.created_at).last.price})
    end
    items
  end
end
