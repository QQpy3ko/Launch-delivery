Rails.application.routes.draw do
  devise_for :users

  root 'launch_menus#home'

end
