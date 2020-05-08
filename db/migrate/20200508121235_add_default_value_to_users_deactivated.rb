class AddDefaultValueToUsersDeactivated < ActiveRecord::Migration[6.0]
  def up
    change_column :users, :deactivated, :boolean, default: false
  end

  def down
    change_column :users, :deactivated, :boolean, default: nil
  end
end
