Spotter::Application.routes.draw do
  resources :reservations

  root to: 'static_pages#home'
  match '/about', to: "static_pages#about"

  authenticated :user do
    root to: 'static_pages#home'
  end
  
  devise_for :users
  resources :users
  resources :parking_lots
end
