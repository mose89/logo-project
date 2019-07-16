Rails.application.routes.draw do
  get 'products/new'
  get 'products/edit'
  get 'products/show'
  get 'products/index'
  devise_for :users
  root 'packages#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
