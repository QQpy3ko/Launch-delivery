class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.decimal :total
      t.string :address
      t.string :phone
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
