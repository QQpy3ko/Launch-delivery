class CreateMenuItemsOrdersJoinTable < ActiveRecord::Migration[6.0]
  def change
    create_join_table :menu_items, :orders
  end
end
