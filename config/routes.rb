Rails.application.routes.draw do
  root 'launch_menus#home'

  namespace :admin do
    resources :menu_items
  end

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :launch_menu, only: :index
    end
  end

  get "launch_menu/(:date)", to: "launch_menus#home",
      :constraints => { :date => /\d{4}-\d{2}-\d{2}/ },
      :as => "launch_menu_date"

  devise_for :users
end
