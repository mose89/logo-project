Rails.application.routes.draw do

  resources :tasks, except:[:show, :index]

  get 'admins/dashboard'
  get 'admins/package'
  get 'admins/order'
  get 'admins/style'
  get 'admins/industry'
  get 'admins/faq'
  get 'admins/gallery'
  get 'admins/product'
  get "admins/post"
  get "admins/company_detail"
  get "admins/task/:id", to: "admins#task", as: "admins_task"

  get "takk-for-din-bestilling", to: "orders#takk", as: "order_takk"
  get "tusen-takk-for-din-bestilling", to: "single_orders#takk", as: "single_orders_takk"

  get "om-oss", to: "faqs#about", as: "om_oss"
  resources :faqs do
    collection {post :import}
  end
  mount Ckeditor::Engine => '/ckeditor'
  resources :services
  resources :contact_mailers do
    member do
      get "takk", to: "contact_mailers#takk", as: "ny_takk"
    end
  end
  resources :styles, except: :edit do
    collection {post :import}
  end

  resources :industries
  resources :orders
  resources :products

  resources :single_orders
  resources :packages

  resources :posts do
    resources :comments
  end

  resources :galleries, except: [:show, :index]

  devise_for :users
  root 'packages#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
