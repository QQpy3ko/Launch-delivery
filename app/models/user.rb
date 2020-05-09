class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, length: {maximum: 50}
  validates :phone, presence: true, length: {maximum: 15}
  validates_format_of :phone, :with => /\A^[\[\]\d \+\-\(\)]*$\Z/, message: "Invalid symbols. Avoid characters, please!"

  after_create :set_admin

  def destroy
    update_attributes(deactivated: true) unless deactivated
  end

  def active_for_authentication?
    super && !deactivated
  end

  private

  def set_admin
    if User.count == 1
      User.first.update_attribute(:admin, true)
    else
      return true
    end
  end
end
