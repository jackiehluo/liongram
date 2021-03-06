Rails.application.routes.draw do
  resources :orders
  resources :users

  get 'session/create'
  get 'session/destroy'
  get 'session/new'

  root 'orders#user_index'
  get 'current-orders' => 'orders#index'
  get 'past-orders' => 'orders#past_index'

  get 'register' => 'users#new'
  get 'users' => 'users#index'
  get 'edit' => 'users#edit'

  get 'login' => 'session#new'
  post 'login' => 'session#create'
  get 'logout' => 'session#destroy'

  resources :users do
    member do
      get :confirm_email
    end
  end

  resources :users do
    member do
        get :approve
    end
  end

  resources :users do
    member do
        get :change_admin_status
    end
  end

  resources :orders do
    member do
        get :confirm_payment
    end
  end

  resources :orders do
    member do
        get :confirm_delivery
    end
  end

  scope '/hooks', :controller => :hooks do
    post :new_order_callback
  end
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
