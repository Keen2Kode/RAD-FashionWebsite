Rails.application.routes.draw do
  get 'collections/index'
  get 'collections/men'
  get 'collections/women'
  get 'collections/kids'
  get 'collections/new_ins'
  resources :items
  
  # doesn't seem to work, want to post newsletter form submit in home/index to Home_Controller def create
  post '/home/index', to: 'home#index'
  root 'home#index'
end
