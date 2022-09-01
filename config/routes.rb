Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: "pages#home"
  devise_for :users
  resources :parties do
<<<<<<< HEAD
    resources :reviews, only: :create
  end
  resources :requests
=======
    resources :requests, only: [:create, :destroy]
  end

  resources :reviews
>>>>>>> 1baa9c6c0442f103ff389a51655b61b83422f287
  resources :favorites
  resources :chatrooms
end
