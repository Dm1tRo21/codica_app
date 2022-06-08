Rails.application.routes.draw do
  namespace :cabinet_doctor do
    get 'cabinet/index'
  end
  namespace :cabinet_patient do
    get 'cabinet/index'
  end
  resources :departments
  namespace :admin do
      resources :users
      resources :doctors
      resources :administrators
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
