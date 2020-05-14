module Api
  module Outer
    module DeviseTokenAuth
      class SessionsController < ::DeviseTokenAuth::SessionsController

        skip_before_action :verify_authenticity_token

        # Prevent session parameter from being passed
        # Unpermitted parameter: session
        wrap_parameters format: []
      end
    end
  end
end
