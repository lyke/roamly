Rails.application.routes.draw do
  root to: "pages#dashboard"
  get "dashboards", to: "pages#dashboard"
  devise_for :users

  resources :travels
  resources :travel_tags, only: [:new, :create]
  resources :trav_trav_type_tags, only: [:new, :create]

  resources :places
  resources :place_traveler_type_tags, only: [:index, :new, :create, :destroy]
  resources :place_tags, only: [:index, :new, :create, :destroy]

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
