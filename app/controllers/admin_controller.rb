class AdminController < WebApplicationController
  before_action :authorized?

  private

  def authorized?
    unless current_user && current_user.admin == true
      flash[:error] = "You are not authorized to view that page."
      redirect_to root_path
    end
  end
end
