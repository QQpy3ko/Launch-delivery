class ApplicationController < ActionController::Base

  protect_from_forgery with: :null_session, if: :devise_token_auth?

  def devise_token_auth?
    controller_path.start_with?('devise_token_auth/')
  end

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :default_address, :phone])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :default_address, :phone])
  end
end
