Whereyouat::Application.routes.draw do

  #devise_for :users
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'home#index'
  devise_for :users, :controllers => {
      :sessions => "users/sessions",
      :confirmation => "users/confirmations",
      :passwords => "users/passwords",
      :registrations => "users/registrations",
      :unlocks => "users/unlocks",
      :omniauth => "users/omniauth_callbacks"
  }
  resources :services do
    collection do
      post :get_users_in_locality, :view_user_profile
    end
  end

  get "/test/index"
  resources :test
  resources :home do
    collection do
      post :create_loc_test
    end
  end

  devise_scope :user do
    #get "sign_up" => "users/registrations#new"
    #get "account" => "users/registrations#edit"
    #get "super_admin" => "users/sessions#super_admin_new"
    #get "partner" => "users/sessions#partner_new"
    get "sign_in" => "users/sessions#new"
    get "sign_out" => "users/sessions#destroy"
    #post "partner_create" => "users/sessions#partner_create"
    #match "/super_admin" => "users/sessions#super_admin_new"
    #match "/partner" => "users/sessions#partner_new"
  end


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
