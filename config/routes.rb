Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"
  root to: "pages#home"
  devise_for :users
  resources :users, only: :show do
    resources :chatrooms, only: [:create, :index] do
      resources :messages, only: [:create]
    end
  end
  resources :chatrooms, only: :show do
    resources :messages, only: [:create]
  end
  resources :parties do
    resources :reviews, only: :create
    resources :requests, only: [:create, :destroy]
  end

  resources :reviews
  resources :favorites
end
