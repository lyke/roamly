Rails.application.routes.draw do
  root to: "pages#dashboard"
  get "dashboards", to: "pages#dashboard"
  devise_for :users
  resources :places
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
