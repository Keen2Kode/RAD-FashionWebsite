Rails.application.routes.draw do

  get 'bag_items/index'
  get 'collections/index'
  resources :collections
  resources :items
  resources :saved
  resources :bag_items
  
  get '/prompt'   => 'users#prompt'
  get  '/signup'  => 'users#signup'
  post '/signup'  => 'users#signed'
  get '/login'    => 'users#login'
  post '/login'   => 'users#logged'
  delete '/logout'=> 'users#logout'
  resources :users, only: [:show]
  
  get 'saved/index'
  # get 'saved' => 'saved#index'
  # put 'edit_saved' => 'saved#edit'
  
  get 'path' => 'saved#index' 
  post 'newsletter' => 'home#newsletter'
  root 'home#index'
end
