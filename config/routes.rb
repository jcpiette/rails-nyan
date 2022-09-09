Rails.application.routes.draw do
  resources :notifcations
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :notifications, only: [:show]
  resources :events, only: [:index, :show, :new, :create, :edit, :destroy]
  resources :user_friends, only: [:index, :show, :new, :create, :edit, :destroy] do
    member do
      post :accept
      delete :decline
    end
  end

  # Defines the root path route ("/")
  root 'pages#home'
end
