class MenuItem < ApplicationRecord

  belongs_to :category
  has_and_belongs_to_many :orders
  has_many :item_histories, autosave: true, :dependent => :destroy
  has_one_attached :photo
  accepts_nested_attributes_for :photo_attachment, allow_destroy: true

  validates_numericality_of :price, :greater_than => 0.0
  validate :acceptable_image

  scope :lazy_attach_and_ordered, -> { with_attached_photo.order("category_id asc, title") }

  def acceptable_image
    return unless photo.attached?

    unless photo.byte_size <= 1.megabyte
      errors.add(:photo, "is too big")
    end

    acceptable_types = ["image/jpeg", "image/png"]
    unless acceptable_types.include?(photo.content_type)
      errors.add(:photo, "must be a JPEG or PNG")
    end
  end
end
