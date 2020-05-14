class AddTokensToUsers < ActiveRecord::Migration[6.0]
  def up
    add_column :users, :provider, :string, null: false, default: 'email'
    add_column :users, :uid, :string, null: false, default: ''
    add_column :users, :tokens, :text

    User.reset_column_information
  end

  def down
    remove_columns :users, :provider, :uid, :tokens
  end
end
