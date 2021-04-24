Rails.application.routes.draw do
  get 'collections/index'
  get 'collections/men'
  get 'collections/women'
  get 'collections/kids'
  get 'collections/new_ins'
  resources :items
  
  # if you want to post from home/index
  # first need to get 'home/index'
  post '', to: 'home#create'
  root 'home#index'
end
