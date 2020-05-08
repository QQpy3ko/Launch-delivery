class AddColumnsToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :admin, :boolean
    add_column :users, :deactivated, :boolean
    add_column :users, :name, :string
    add_column :users, :default_address, :string
    add_column :users, :phone, :string
  end
end
