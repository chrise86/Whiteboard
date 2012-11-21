SuperWhiteboard::Application.routes.draw do

  root :to => 'calendar#index'

  get "calendar/index"

  get "gradebook/index"

  get "gradebook/add_category"

  get "gradebook/remove_category"

  get "gradebook/add_event"

  get "gradebook/remove_event"

  get "gradebook/add_student"

  get "gradebook/remove_student"

  get "gradebook/calculate_grades"

  get "section/add_student"

  get "section/remove_student"

  get "section/add_assignment"

  get "section/remove_assignment"

  get "section/add_content"

  get "section/remove_content"

  get "section/add_professor"

  get "section/remove_professor"

  get "dragon_drop/add_event_to_section"

  get "dragon_drop/remove_event_from_section"

  get "dragon_drop/add_category"

  get "dragon_drop/remove_category"

  get "dragon_drop/add_event"

  get "dragon_drop/remove_event"

  get "dragon_drop/change_course"

  get "event/add_question"

  get "event/remove_question"

  get "event/add_new_download"

  get "event/remove_download"

  get "event/grade_event"

  get "event/show"

  devise_for :users

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
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
