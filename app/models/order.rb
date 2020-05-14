class Order < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :menu_items

  def start_time
    self.created_at
  end

  scope :for_current_customer, -> (customer_id) { where("user_id = ?", customer_id).order("id desc")}
end
