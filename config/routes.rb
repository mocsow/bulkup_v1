Rails.application.routes.draw do
  # Devise routes for authentication
  devise_for :admins
  devise_for :members

  # Custom GET routes for sign-out
  devise_scope :member do
    get "/members/sign_out", to: "devise/sessions#destroy"
  end

  devise_scope :admin do
    get "/admins/sign_out", to: "devise/sessions#destroy"
  end

  # Custom root based on user type
  authenticated :admin do
    root to: "admin_panel/dashboard#index", as: :authenticated_admin_root
  end

  authenticated :member do
    root to: "products#index", as: :authenticated_member_root
  end

  # Default root for unauthenticated users
  root "products#index"

  # Member routes
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
    resources :products, except: [:show] do
      member do
        get :delete # Route for delete confirmation page
      end
    end
    resources :group_orders, only: [:index, :show, :update] # Admin management of group orders
  end
end
