Rails.application.routes.draw do

  resources :collections, only: [:show, :index]
  resources :items
  resources :saved, only: [:index, :update]
  resources :bag_items do
    # like bag_items#destroy, but for ALL bag_items
    delete :destroy_all, on: :collection
  end
  
  get '/prompt'   => 'users#prompt'
  get  '/signup'  => 'users#signup'
  post '/signup'  => 'users#signed'
  get '/login'    => 'users#login'
  post '/login'   => 'users#logged'
  delete '/logout'=> 'users#logout'
  resources :users, only: [:show, :edit, :update]
  
  post 'newsletter' => 'home#newsletter'
  root 'home#index'
end
