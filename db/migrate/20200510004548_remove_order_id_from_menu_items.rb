class RemoveOrderIdFromMenuItems < ActiveRecord::Migration[6.0]
  def change
    remove_reference :menu_items, :order
  end
end
