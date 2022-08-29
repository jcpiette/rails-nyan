Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :users
  resources :addresses, :preferences, :groups, :user_friends, :events, only: [:index, :show, :new, :edit, :destroy]
  # Defines the root path route ("/")
  # root "articles#index"
  root 'pages#home'
end
