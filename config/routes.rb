Rails.application.routes.draw do
  get 'group_orders/show'
  get 'group_orders/join'
  get 'group_orders/cancel'
  get 'orders/index'
  get 'products/index'
  get 'products/show'
  # member routes
  root "products#index" # homepage to show product catalogue
  resources :products, only: [:index, :show] #catalogue and product details
  resources :orders, only: [:index] # member's orders
  resources :group_orders, only: [:show] do
    member do
      post :join # member cancels participation in a group order
      delete :cancel
    end
  end

  # admin routes
  namespace :admin do
    get 'group_orders/index'
    get 'group_orders/show'
    get 'group_orders/update'
    get 'products/index'
    get 'products/new'
    get 'products/create'
    get 'products/edit'
    get 'products/update'
    get 'products/destroy'
    get 'dashboard/index'
    root "dashboard#index" # admin dashboard
    resources :products # CRUD management of products
    resources :group_orders, only: [:index, :show, :update] # admin management of group orders
  end
end
