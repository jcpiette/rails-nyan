Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :users do
    resources :user_friends, :events, only: [:index, :show, :new, :edit, :destroy]
<<<<<<< HEAD
    get '/notification', to: 'pages#notification'
    get '/address', to: 'pages#address'
    get '/preferences', to: "pages#preferences"

=======
    get '/notification', to: 'users#notification'
    get '/address', to: 'users#address'
    get '/preferences', to: 'users#preferences'
>>>>>>> 080818a969c320c2d86b688d306f098338502062
  end
  # Defines the root path route ("/")
  # root "articles#index"

  root 'pages#home'
end
