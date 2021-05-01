Rails.application.routes.draw do
  get 'collections/index'
  resources :collections
  resources :items
  
  # if you want to post from home/index
  # first need to get 'home/index'
  post '' => 'home#create'
  root 'home#index'
end
