module Api
  module Outer
    module DeviseTokenAuth
      class SessionsController < ::DeviseTokenAuth::SessionsController

        skip_before_action :verify_authenticity_token
        before_action :require_admin

        # Prevent session parameter from being passed
        # Unpermitted parameter: session
        wrap_parameters format: []
        private

        def require_admin
          puts "PP#{params[:email]}"
          user = User.where("email LIKE ?", params[:email]).first
          puts "UMAIL +++ #{user.email}"
          if !user.admin
            head :unauthorized
          end
        end
      end
    end
  end
end
