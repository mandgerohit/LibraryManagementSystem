Rails.application.routes.draw do
  
    get 'suggested_books/suggest'
    get 'subscribes/create'
    get 'users/admins' => 'admins#index'
    get 'users/members' => 'members#index'
    get 'users/search' => 'search#index'
    get 'books/search' => 'books#search'
    get 'checkout_logs/new'
    get 'checkout_logs/show'
    get 'suggest' => 'suggested_books#suggest'
    get 'approve' => 'suggested_books#index'
    post 'subscribe' => 'subscribes#create'
    resources :checkout_logs
    resources :users
    resources :books
    resources :suggested_books
    resources :subscribes
    get 'checkout_logs/:id'  => 'checkout_logs#index'
    get 'checkout_user'  => 'checkout_logs#checkout'
    post 'users/:id'  => 'users#removestatus'
    post 'users/admins/:id'  => 'admins#removestatus'
    get 'books/new'
    get 'addbook'  => 'books#new'
    get 'sessions/new'
    root 'static_pages#home'
    get 'static_pages/about'
    get 'users/new'
    get 'signup'  => 'users#new'
    get 'membersignup'  => 'members#new'
    get    'login'   => 'sessions#new'
    post   'login'   => 'sessions#create'
    delete 'logout'  => 'sessions#destroy'
    post  'books/:id'  => 'books#togglebookstatus'
    
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
