Rails.application.routes.draw do
  namespace :cabinet_doctor do
    resources :appointments, only: [:index, :show, :edit, :update]
  end
  namespace :cabinet_patient do
    resources  :appointments, only: [:index, :show, :create] do
      get '/department/:department_id/new', to: 'appointments#new', as: 'new', on: :collection
      get 'add', to: 'appointments#add', as: 'add', on: :collection
    end
    get 'cabinet/index'
  end
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
