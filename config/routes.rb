Rails.application.routes.draw do
  scope module: :admin do
    devise_for :admin
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :admin do
    get "/" => "homes#top"
    resources :items, only: [:new, :index, :create, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :end_users, only: [:index, :show, :edit, :update]
    resources :orders, only: [:show, :update]
    resources :order_details, only: [:update]
  end

  scope module: :public do
    devise_for :end_users
    root to: 'homes#top'
    get "/about" => "homes#about"
    resources :items, only: [:index, :show]
    resources :end_users, only: [:show, :edit, :update]
    get "/end_users/confirm" => "end_users#confirm"
    patch "/end_users/about" => "end_users#withdraw"
    resources :cart_items, only: [:index, :create, :update, :destroy, :destroy_all]
    resources :orders, only: [:new, :index, :create, :show]
    get "/orders/complete" => "orders#complete"
    post "/orders/confirm" => "orders#confirm"
    resources :addresses, only: [:index, :create, :edit, :update, :destroy]
  end

end
