class MenuItem < ApplicationRecord

  belongs_to :category
  has_and_belongs_to_many :orders
  has_many :item_histories, autosave: true, :dependent => :destroy

  has_one_attached :photo

  scope :lazy_attach_and_ordered_by_category, -> { with_attached_photo.order("category_id asc") }
end
