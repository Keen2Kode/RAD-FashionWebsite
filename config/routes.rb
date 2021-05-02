Rails.application.routes.draw do

  get 'collections/index'
  resources :collections
  resources :items
  resources :saved
  
  get '/prompt' => 'users#prompt'
  get  '/signup' => 'users#new'
  post '/signup' => 'users#create'
  resources :users, only: [:show]
  
  get 'saved/index'
  # get 'saved' => 'saved#index'
  # put 'edit_saved' => 'saved#edit'
  
  get 'path' => 'saved#index' 
  post 'newsletter' => 'home#newsletter'
  root 'home#index'
end
