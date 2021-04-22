Rails.application.routes.draw do
  get 'collections/index'
  get 'collections/men'
  get 'collections/women'
  get 'collections/kids'
  get 'collections/new_ins'
  resources :items
  root 'home#index'
end
