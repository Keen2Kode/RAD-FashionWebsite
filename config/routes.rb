Rails.application.routes.draw do

  resources :collections, only: [:show, :index]
  
  resources :saved, only: [:index, :update]
    
  resources :items do
    get :filter, on: :member
  end
  
  resources :bag_items do
    delete :destroy_all, on: :collection
  end
  
  get '/prompt'           => 'users#prompt'
  get  '/signup'          => 'users#signup'
  post '/signup'          => 'users#signed'
  get '/login'            => 'users#login'
  post '/login'           => 'users#logged'
  delete '/logout'        => 'users#logout'
  get '/forgot_password'  => 'users#forgot_password'
  post '/forgot_password' => 'users#reset_password'
  resources :users, only: [:show, :edit, :update] do
    post :subscription, on: :member
  end
  
  post 'newsletter' => 'home#newsletter'
  root 'home#index'
end
