module Api
  module Outer
    class ApplicationController < ActionController::Base
      include DeviseTokenAuth::Concerns::SetUserByToken

      before_action :authenticate_user!
      before_action :configure_permitted_parameters, if: :devise_controller?

      protected

      def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_in, keys: [:email, :password])
      end
    end
  end
end
