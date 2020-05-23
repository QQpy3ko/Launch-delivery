class MenuItem < ApplicationRecord

  belongs_to :category
  has_and_belongs_to_many :orders
  has_many :item_histories, autosave: true, :dependent => :destroy
  has_one_attached :photo
  accepts_nested_attributes_for :photo_attachment, allow_destroy: true

  validates_numericality_of :price, :greater_than => 0.0
  validate :acceptable_image

  scope :with_attach_info, -> { with_attached_photo }
  scope :with_attach_info_and_ordered, -> { with_attached_photo.order("category_id asc, title") }
  scope :with_histories, -> (till_day) { includes(:item_histories)
                                        .where("item_histories.created_at < ?", till_day)
                                        .order("item_histories.created_at")
                                        .where("item_histories.active = ?", true)
                                        .references(:item_histories)
                                        }

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
