class MenuItem < ApplicationRecord
  belongs_to :category
  belongs_to :order
  has_many :item_histories

  has_one_attached :avatar

  before_save :set_menu_item_history

  def set_menu_item_history
    if price_changed? || active_changed?
      a = ItemHistory.new(table_id: :id,  price: :price, active: :active)
      a.save
    end
  end
end
