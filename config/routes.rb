Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"
  root to: "pages#home"
  devise_for :users
  match '/create_chatroom', :to => "chatrooms#create", via: :get
  resources :chatrooms, only: [:index, :show, :new, :create]  do
    resources :messages, only: [:create]
  end
  resources :parties do
    resources :reviews, only: :create
    resources :requests, only: [:create, :destroy]
  end
  resources :reviews
  resources :favorites
  resources :users, only: :show do
    resources :favorites, only: :create
  end

end
