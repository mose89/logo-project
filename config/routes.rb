Rails.application.routes.draw do

  resources :styles, except: :edit
  resources :industries
  resources :orders
  resources :products
  resources :packages

  devise_for :users
  root 'packages#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
