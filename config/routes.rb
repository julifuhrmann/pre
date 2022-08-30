Rails.application.routes.draw do
  get 'reviews/index'
  get 'reviews/show'
  get 'reviews/new'
  get 'reviews/create'
  get 'chatrooms/index'
  get 'chatrooms/show'
  get 'chatrooms/new'
  get 'chatrooms/create'
  get 'requests/index'
  get 'requests/show'
  get 'requests/new'
  get 'requests/create'
  get 'requests/edit'
  get 'requests/update'
  get 'requests/destroy'
  get 'favorites/index'
  get 'favorites/show'
  get 'favorites/new'
  get 'favorites/create'
  get 'favorites/destroy'
  get 'parties/index'
  get 'parties/show'
  get 'parties/new'
  get 'parties/create'
  get 'parties/edit'
  get 'parties/update'
  get 'parties/destroy'
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
