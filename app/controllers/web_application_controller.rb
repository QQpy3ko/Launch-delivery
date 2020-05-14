class WebApplicationController < ApplicationController

  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def authorized?
    user_signed_in?
  end

  def handle_unauthorized
    unless authorized?
      respond_to do |format|
        format.json { render :unauthorized, status: 401 }
      end
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :default_address, :phone])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :default_address, :phone])
  end
end
