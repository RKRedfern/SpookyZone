Rails.application.routes.draw do

  root "sessions#home"

  get '/signup' => 'users#new'
  post '/signup' => 'users#create'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'

  delete '/logout' => 'sessions#destroy'

  get "/auth/google_oauth2/callback" => 'sessions#google'

  
  resources :stories do 
    resources :comments
  end
  
  resources :comments
  
  resources :users do 
    resources :stories, shallow: true
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

