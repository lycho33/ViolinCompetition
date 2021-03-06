Rails.application.routes.draw do
  
  get '/auth/google_oauth2/callback', to: 'sessions#omniauth'
  
  root('sessions#home')

  get '/signup', to: 'users#new', as: 'signup'
  post '/signup', to: 'users#create'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  delete '/logout', to: 'sessions#logout'
  
  resources :users do
    resources :blogs
  end
  resources :performances do
    resources :comments, only: [:create] #this nested route isn't really used
  end

  resources :performers

  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
