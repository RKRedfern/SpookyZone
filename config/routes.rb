Rails.application.routes.draw do

  root "sessions#home"

  get '/signup' => 'users#new'
  post '/signup' => 'users#create'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'

  delete '/logout' => 'sessions#destroy'

  resources :comments
  resources :stories do 
    resources :posts, only: [:new, :create, :index]
  end
  resources :users do 
    resources :posts, only: [:new, :create, :index]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end


#<ActionController::Parameters {"authenticity_token"=>"Dm8fvQbuuJnmNsYNkB_BrM-ix5qRa_zxsvQiRrqPqz8eapf4xca7WPrdlfmOVXhSW05BdBJVNnfSTG1mozawrg", 

# "story"=>{"title"=>"Scary", "content"=>"Very VERY SCARY"}, "commit"=>"Create Story", "controller"=>"stories", "action"=>"create"} permitted: false>