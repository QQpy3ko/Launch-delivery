module Api
  module V1
    class LaunchMenuController < WebApplicationController

      def index
        @filter_till_next_day = params[:date] ? Date.parse(params[:date]).next_day : Date.today.next_day

        @menu_items_with_histories = MenuItem.with_attach_info
                                            .includes(:item_histories)
                                            .where("item_histories.created_at < ?", @filter_till_next_day)
                                            .order("item_histories.created_at")
                                            .where("item_histories.active = ?", true)
                                            .references(:item_histories)

        @menu_items_with_histories = @menu_items_with_histories.map do | i |
          if i.photo.attached?
            i.attributes.merge({ :photo_url => rails_blob_path(i.photo, disposition: "attachment"), :history_price => i.item_histories.last.price})
          else
            i.attributes.merge({ :history_price => i.item_histories.last.price})
          end
        end

        render json: @menu_items_with_histories
      end
    end
  end
end
