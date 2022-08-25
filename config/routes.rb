Rails.application.routes.draw do
  resources :preferences
  resources :groups
  resources :user_friends
  resources :events
  resources :addresses
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'pages#home'
end
