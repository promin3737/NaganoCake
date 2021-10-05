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
  
  resources :events
  # get "/events.json" => "events#index"
  
  scope module: :public do

    devise_for :end_users

    root to: 'homes#top'
    get "/about" => "homes#about"

    resources :items, only: [:index, :show] do
      resource :favorites, only: [:create, :destroy]
    end
    
    resources :accesses, only: [:index]
    resources :items, only: [:index, :show]

    patch "/end_user" => "end_users#update"
    put "/end_user" => "end_users#update"
    get "/end_user/edit_profile" => "end_users#edit"
    get "/end_user/mypage" => "end_users#mypage"
    get "/end_user/confirm" => "end_users#confirm"
    patch "/end_user/withdraw" => "end_users#withdraw"
    put "/end_user/withdraw" => "end_users#withdraw"

    patch "/cart_items" => "cart_items#update"
    put "/cart_items" => "cart_items#update"
    delete "/cart_items" => "cart_items#destroy"
    delete "/cart_items/all" => "cart_items#destroy_all"
    resources :cart_items, only: [:index, :create]

    get "/orders/confirm" => "orders#confirm"
    get "/orders/complete" => "orders#complete"
    resources :orders, only: [:new, :index, :create]
    get "/orders/:id" => "orders#show", as: "order"

    resources :addresses, only: [:index, :create, :edit, :update, :destroy]

  end

end
