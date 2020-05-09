class Order < ApplicationRecord
  belongs_to :user
  has many :menu_items

  after_initialize :init, :if => :new_record?

  def init
    self.phone ||= user_phone
    self.address ||= user_address
  end
end
