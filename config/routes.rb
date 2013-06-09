Spotter::Application.routes.draw do
  authenticated :user do
    root to: 'static_pages#home'
  end
  devise_for :users
  match '/about', to: "static_pages#about"
  root to: 'static_pages#home'
end
