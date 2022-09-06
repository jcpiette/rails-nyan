Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :users do
    resources :events, only: [:index, :show, :new, :edit, :destroy]
    resources :user_friends, :events, only: [:index, :show, :new, :create, :edit, :destroy]
  end
  # Defines the root path route ("/")
  # root "articles#index"

  root 'pages#home'
end
