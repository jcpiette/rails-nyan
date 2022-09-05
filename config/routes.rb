Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :users do
    resources :events, only: [:index, :show, :new, :edit, :destroy]
    resources :user_friends, :events, only: [:index, :show, :new, :create, :edit, :destroy]
    get '/notification', to: 'users#notification'
    get '/address', to: 'users#address'
    get '/preferences', to: 'users#preferences'
    post '/notification', to: 'users#notification'
  end
  # Defines the root path route ("/")
  # root "articles#index"

  root 'pages#home'
end
