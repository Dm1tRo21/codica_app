Rails.application.routes.draw do
  resources :departments
  namespace :admin do
      resources :users
      resources :departments

      root to: "users#index"
    end
  devise_for :users
  root 'home#index'
  get 'home/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
