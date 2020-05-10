Rails.application.routes.draw do

  devise_for :users

  get "launch_menu/(:date)", to: "launch_menus#home",
      :constraints => { :date => /\d{4}-\d{2}-\d{2}/ },
      :as => "launch_menu_date"

  root 'launch_menus#home'
  namespace :admin do
    resources :menu_items
  end
end
