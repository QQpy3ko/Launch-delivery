module Api
  module V1
    class LaunchMenuController < WebApplicationController

      def index
        @filter_till_next_day = params[:date] ? Date.parse(params[:date]).next_day : Date.today.next_day

        @menu_items_with_histories = MenuItem.with_attach_info.with_histories(@filter_till_next_day)

        render json: @menu_items_with_histories
      end
    end
  end
end
