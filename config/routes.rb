Rails.application.routes.draw do
  root('sessions#home')

  get '/signup', to: 'users#new', as: 'signup'
  post '/signup', to: 'users#create'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  delete '/logout', to: 'sessions#logout'
  
  resources :comments
  resources :performances
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
