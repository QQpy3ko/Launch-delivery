class CreateItemHistories < ActiveRecord::Migration[6.0]
  def change
    create_table :item_histories do |t|
      t.decimal :price
      t.boolean :active
      t.references :menu_item, null: false, foreign_key: true

      t.timestamps
    end
  end
end
