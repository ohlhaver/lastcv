Tapcv::Application.routes.draw do
  
  get "password_resets/new"
  get 'candidate_new_password_reset', to: 'password_resets#candidate_new', as: 'candidate_new_password_reset'

  get "static_pages/home"

  get "static_pages/about"

  get "static_pages/contact"

  get "static_pages/faq"

  get "static_pages/privacy"

  get "static_pages/thanks"

  get "sessions/new"
  resources :users
  resources :candidates
  resources :sessions
  resources :queries
  resources :profiles
  resources :invitations
  resources :password_resets
  get "profiles/new"
  get "profiles/create"
  
  resources :profiles do
    member do
      get :confirm, :invite
      post :confirm, :invite
    end
  end

  resources :invitations do
    member do
      post :accept
      get :accept
    end
  end

  resources :queries do
    member do
      get :reset
      post :reset
    end
  end


  get 'edit', to: 'users#edit', as: 'edit'
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  get 'thanks', to: 'static_pages#thanks', as: 'thanks'
  get 'privacy', to: 'static_pages#privacy', as: 'privacy'
  get 'edit_candidate', to: 'candidates#edit', as: 'edit'
  get 'signup_candidate', to: 'candidates#new', as: 'candidate_signup'
  get 'candidate_login', to: 'sessions#candidate_new', as: 'candidate_login'
  match 'auth/:provider/callback', to: 'sessions#candidate_create'
  match 'auth/failure', to: redirect('/')
  #match 'signout', to: 'sessions#candidate_destroy', as: 'signout'

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
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

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
   root :to => "static_pages#home"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
    devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
end
