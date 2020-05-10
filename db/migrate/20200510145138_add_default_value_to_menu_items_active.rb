class AddDefaultValueToMenuItemsActive < ActiveRecord::Migration[6.0]
  def up
    change_column :menu_items, :active, :boolean, default: false
  end

  def down
    change_column :menu_items, :active, :boolean, default: nil
  end
end
