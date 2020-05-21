class MenuItemSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :title, :history_price, :photo_url, :category_id

  def history_price
    object.item_histories.last.price
  end

  def category_id
    object.category_id
  end

  def photo_url
    rails_blob_path(object.photo, disposition: "attachment") if object.photo.attached?
  end
end
