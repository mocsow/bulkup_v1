Rails.application.routes.draw do
  # Devise routes for authentication
  devise_for :admins
  devise_for :members

  # Member routes
  root "products#index" # Homepage to show product catalog
  resources :products, only: [:index, :show] # Catalog and product details
  resources :orders, only: [:index] # Member's orders
  resources :group_orders, only: [:show] do
    member do
      post :join # Member joins a group order
      delete :cancel # Member cancels participation in a group order
    end
  end

  # AdminPanel routes
  namespace :admin_panel do
    root "dashboard#index" # Admin dashboard
    resources :products # CRUD management of products
    resources :group_orders, only: [:index, :show, :update] # Admin management of group orders
  end
end
