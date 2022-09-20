Rails.application.routes.draw do
  devise_for :users, controllers: { confirmations: 'users/confirmations' }

  # specified the sign in and sign out routes for letter opener
  as :user do 
    get "signin", to: "devise/sessions#new"
    post "signin", to: "devise/sessions#create"
    delete "signout", to: "devise/sessions#destroy"
  end

  root "home#index"
  get "comments/:id", to: "comments#new"
  delete "comments/:id", to: "comments#destroy", as: :destroy_comment

  resources :posts
  resources :comments, only: [:create, :edit, :update]
end
