Spotter::Application.routes.draw do
  root to: 'static_pages#home'
  match '/about', to: "static_pages#about"

  authenticated :user do
    root to: 'static_pages#home'
  end
  
  devise_for :users
  resources :users do
    resources :parking_lots
    resources :reservations
  end

  resources :parking_lots do
    resources :reservations
  end
end
