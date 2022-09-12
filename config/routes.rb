Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root "home#index"

  delete "posts/:id", to: "posts#destroy", as: :destroy_post
  resources :posts, only: [:index, :new, :show, :update, :create, :edit] 

  get "comments/:id", to: "comments#new"
  delete "comments/:id", to: "comments#destroy", as: :destroy_comment
  resources :comments, only: [:create, :edit, :update]
end
