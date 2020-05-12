Rails.application.routes.draw do
  root 'pages#menu'

  namespace :admin do
    resources :menu_items
  end

  namespace :api do
    namespace :v1 do
      get "launch_menu/(:date)", to: "launch_menu#index",
                                :constraints => { :date => /\d{4}-\d{2}-\d{2}/ },
                                :as => "launch_menu_date"
      resources :orders, defaults: { format: :json }, only: :create
    end
  end

  devise_for :users
end
