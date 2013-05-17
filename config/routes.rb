Gpstracker::Application.routes.draw do
  devise_for :users do 
    get '/users/sign_out' => 'devise/sessions#destroy' 
  end

  devise_for :administrators, :controllers => {:sessions => "administrator/sessions"} do 
    get '/administrators/sign_out' => 'administrator/sessions#destroy' 
    get '/admin' => 'administrator/sessions#new' 
  end

  
  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  #match '/' => 'user/home#index'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  namespace :administrator do
    resources :administrators
    resources :users
    resources :devices
    match '/new_device_prot' => 'devices#new_prot' 
    match '/dashboard' => 'dashboard#index'
    root :to => 'dashboard#index'
  end

  namespace :user do
    resources :devices do
      get  'location'
      get  'start_tracking'
      get 'finish_tracking_route'
      get 'cancel_tracking_route'
      post 'create_tracking_route'
      collection do
        get  'location'
        get  'register_device'
        post 'assign_device'
      end
    end
    
    match '/dashboard' => 'home#dashboard'
    match '/pricing' => 'home#pricing'
    match '/how_it_works' => 'home#how_it_works'
    match '/contact_us' => 'home#contact_us'
    match '/help' => 'home#help'

    match '/reports' => 'home#reports'
    match '/map_devices' => 'home#map_devices'
    match '/lineal_regresion' => 'home#lineal_regresion'
    match '/dependency_analysis' => 'home#dependency_analysis'
    match '/stationality_analysis' => 'home#stationality_analysis'
    match '/devices' => 'home#devices'
    match '/generate_graph' => 'home#generate_graph'
    match '/variable_history' => 'home#variable_history'
    root :to => 'home#dashboard'
  end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'
  root :to => 'user/home#index'
  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
