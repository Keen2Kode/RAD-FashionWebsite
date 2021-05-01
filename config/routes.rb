Rails.application.routes.draw do
  get 'saved/index'
  get 'collections/index'
  resources :collections
  resources :items
  resources :saved
  
  # get 'saved' => 'saved#index'
  # put 'edit_saved' => 'saved#edit'
  
  get 'path' => 'saved#index' 
  post 'newsletter' => 'home#newsletter'
  root 'home#index'
end
