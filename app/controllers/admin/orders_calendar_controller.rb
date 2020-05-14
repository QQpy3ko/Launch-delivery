class Admin::OrdersCalendarController < AdminController
  before_action :authenticate_user!

  def calendar
    @orders = Order.all

    respond_to do |format|
      format.html{render :orders_calendar}
      format.js{}
    end
  end

  private

  def event_params
    params.require(:event).permit(:start_time)
  end
end
