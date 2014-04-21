Rails.application.routes.draw do
  resources :rvotes

  resources :reviews

  resources :avotes

  resources :qvotes

  get 'search/index'

  #get 'questions/new_modal' => 'question#new_modal', :as=> :new_modal

  #get 'publications/add_question' => 'publication#add_question', :as=> :add_question

  resources :users do
    member do
      get :voted_publications
    end
  end

  resources :answers

  resources :questions do
    member do
      get 'add_answer'
    end
  end

  resources :voteactions

  resources :publications do
    member do
      get :voters
      get 'add_question'
      get 'add_review'
    end
  end




  resources :sessions, only: [:new, :create, :destroy]

  match '/signup',  to: 'users#new', via: 'get'

  match '/signin',  to: 'sessions#new',         via: 'get'
  match '/signout', to: 'sessions#destroy',     via: 'delete'

  root 'publications#index'


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
