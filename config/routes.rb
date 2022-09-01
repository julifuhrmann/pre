Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: "pages#home"
  devise_for :users
  resources :parties do
    resources :requests, only: [:create, :destroy]
  end
  get "user", to: "users#show"
  resources :reviews
  resources :favorites
  resources :chatrooms
  resources :users, only: :show
end
