Rails.application.routes.draw do
  resources :notifcations
  devise_for :users, controllers: { registrations: 'registrations' }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :users do
    resources :events, only: [:index, :show, :new, :edit, :destroy]
    resources :user_friends, :events, only: [:index, :show, :new, :create, :edit]
    resources :user_friends, :events, only: :destroy, as: :user_friend_delete
    resources :notifications, only: [:show]
  end
  # Defines the root path route ("/")
  # root "articles#index"
  get 'events/find_event_type', to: 'events#find_event_type'
  get 'events/find_event_budget', to: 'events#find_event_budget'
  get 'events/find_event_location', to: 'events#find_event_location'
  get 'events/suggestions', to: 'events#suggestions'
  root 'pages#home'

end
