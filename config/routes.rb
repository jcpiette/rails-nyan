Rails.application.routes.draw do
  resources :notifcations
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :users do
    resources :events, only: [:index, :show, :new, :create, :edit, :destroy]
    resources :user_friends, :events, only: [:index, :show, :new, :create, :edit]
    resources :user_friends, :events, only: :destroy, as: :user_friend_delete
    resources :notifications, only: [:show]
  end
  # Defines the root path route ("/")
  # root "articles#index"
  get 'events/suggestions', to: 'events#suggestions'
  root 'pages#home'

end
