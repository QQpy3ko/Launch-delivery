class MenuItem < ApplicationRecord

  belongs_to :category
  has_and_belongs_to_many :orders
  has_many :item_histories, autosave: true, :dependent => :destroy

  # has_one_attached :photo
end
