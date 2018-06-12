Rails.application.routes.draw do
  resources :orders
  resources :addresses
  resources :users
  resources :roles
  resources :plannings
  resources :products
  resources :categories
  resources :weeks
  resources :bakeries
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
end
