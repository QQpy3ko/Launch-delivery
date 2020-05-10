class Api::V1::LaunchMenuController < ApplicationController
  def index
    @menu_items = MenuItem.lazy_attach_and_ordered.where("active = true")
    @menu_items = @menu_items.map{ | i | i.photo.present? ? i.attributes.merge({ :photo_url => i.photo.service_url }) : i }

    render json: @menu_items.to_json
  end
end
