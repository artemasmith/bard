Bard::Application.routes.draw do

  get 'unvalidated_wares/index'

  get 'unvalidated_wares/show'

  get 'unvalidated_wares/new'

  get 'unvalidated_wares/edit'

  get 'unvalidated_wares/create'

  get 'unvalidated_wares/update'

  get 'unvalidated_wares/destroy'

  resources :users, only: [:cabinet, :settings, :update] do
    member do
      get :cabinet
      get :settings
      get :stats
      put :update_tariff
    end
    resources :shops
    resources :payments, only: [:new, :create]
    resources :unvalidated_wares, path: :uwares
  end
  resource :greetings, only: [:index] do
    collection do
      get :about
      get :contact
    end
    get :index
  end

  resources :shops do
    member do
      get :wares
    end
  end

  resources :wares
  resources :barcodes
  devise_for :users

  root 'greetings#index'

  namespace :api, defaults: { format: :xml } do
    scope module: :v1, constraints: ApiConstraints.new(version: 1, default: :true) do
      match '/barcode' => 'barcodes#show', via: :get, as: :show_barcode_api
      match '/barcode' => 'barcodes#create', via: :post, as: :create_barcode_api
      match '/barcodes' => 'barcodes#index', via: :get, as: :all_barcodes_api
    end
  end
#  devise_for :users
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
#  root 'barcodes/index'
end
