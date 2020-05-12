class PagesController < ApplicationController
  def menu
    @launch_date = params[:date] ? Date.parse(params[:date]) : Date.today
  end
end
