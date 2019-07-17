Rails.application.routes.draw do
  get 'styles/new'
  get 'styles/show'
  get 'styles/index'
  get 'industries/new'
  get 'industries/edit'
  get 'industries/show'
  get 'industries/index'
  get 'orders/new'
  get 'orders/edit'
  get 'orders/show'
  get 'orders/index'
  get 'products/new'
  get 'products/edit'
  get 'products/show'
  get 'products/index'
  devise_for :users
  root 'packages#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
