Rails.application.routes.draw do
    match "stores/login",     :to => "stores#login",    :via => [:get, :post]
    
    match "stores/security",  :to => "stores#security", :via => [:get, :post]
    
    match "stores/random",    :to => "stores#random",   :via => [:get, :post]
    
    match "stores/new",       :to => "stores#new",       :via => [:get, :post]
    
    match "stores/lock",      :to => "stores#lock",     :via => [:get]
    
    match "stores/register",  :to => "stores#register", :via => [:get, :post]
    
    match "stores/welcome",   :to => "stores#welcome", :via => [:get, :post]
    
    match "stores/logout",    :to => "stores#logout",   :via => [:get, :post]

    mount RuCaptcha::Engine => "/rucaptcha"

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
