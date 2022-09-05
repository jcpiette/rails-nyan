Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :users do
    resources :user_friends, :events, only: [:index, :show, :new, :create, :edit, :destroy]
    get 'users/notification', to: 'pages#notification'
  end
  # Defines the root path route ("/")
  # root "articles#index"
  root 'pages#home'
end
