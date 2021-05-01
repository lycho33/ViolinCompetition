Rails.application.routes.draw do
  root('sessions#home')

  get '/signup', to: 'users#new', as: 'signup'
  post '/signup', to: 'users#create'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  delete '/logout', to: 'sessions#logout'
  
  resources :users
  resources :performances do
    resources :comments, only: [:create]
  end

  get '/auth/google_oauth2/callback', to: 'sessions#omniauth'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
