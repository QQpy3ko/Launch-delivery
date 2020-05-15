module Admin
  class UsersController < WebApplicationController
    before_action :authenticate_user!

    def index
      @users = User.all.order("created_at DESC")
    end
  end
end
