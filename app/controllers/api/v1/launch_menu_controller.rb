class Api::V1::LaunchMenuController < ApplicationController
  def index

    @tomorrow_for_comparing = params[:date] ? Date.parse(params[:date]).next_day : Date.today.next_day

    @menu_items_with_histories = MenuItem.includes(:item_histories).
                                          where("item_histories.created_at < ?", @tomorrow_for_comparing).
                                          order("item_histories.created_at").
                                          where("item_histories.active = ?", true).
                                          references(:item_histories)

    @menu_items_with_histories = @menu_items_with_histories.map do | i |
      if i.photo.present?
        i.attributes.merge({ :photo_url => i.photo.service_url, :history_price => i.item_histories.last.price})
      else
        i.attributes.merge({ :history_price => i.item_histories.last.price})
      end
    end

    render json: @menu_items_with_histories.to_json
  end
end
