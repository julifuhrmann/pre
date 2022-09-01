Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: "pages#home"
  devise_for :users
  resources :parties do
    resources :reviews, only: :create
  end
  resources :requests
  resources :favorites
  resources :chatrooms
end
