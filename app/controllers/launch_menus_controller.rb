class LaunchMenusController < ApplicationController
  def home
    @launch_date = params[:date] ? Date.parse(params[:date]) : Date.today
  end
end
