Rails.application.routes.draw do
  devise_for :users

  root 'pages#menu'

  namespace :admin do
    resources :menu_items
    resources :users, only: :index
    get 'orders-calendar', to: "orders_calendar#calendar"
  end

  namespace :api do
    namespace :v1 do
      get "launch_menu/(:date)", to: "launch_menu#index",
                                :constraints => { :date => /\d{4}-\d{2}-\d{2}/ },
                                :as => "launch_menu_date"
      resources :orders, defaults: { format: :json }, only: :create
    end
    namespace :outer do
      mount_devise_token_auth_for 'User', at: 'auth',
        controllers: {
          sessions: 'api/outer/devise_token_auth/sessions'
        }
    end
  end

  resources :orders, only: :index
end
