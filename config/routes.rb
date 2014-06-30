Rails.application.routes.draw do
  resources :detalles_basicos

  resources :create_detalles_basicos

  resources :proveedors

  get 'recepcion_materiales/insumos'

  get 'recepcion_materiales/ingredientes'

  resources :merma_ingredientes

  resources :merma_insumos

  match "/404", :to => "errors#not_found", via: 'get'
  match "/422", :to => "errors#unacceptable", via: 'get'
  match "/500", :to => "errors#internal_error", via: 'get'
  match "/acceso_denegado", :to => "errors#acceso_denegado", via: 'get'
  
  post 'users/crear' => 'user#crear'
  get '/usuarios' => 'user#index'

  get 'preparar' => 'preparar#index'
  get 'preparar_pruebas' => 'preparar#pruebas'
  get 'preparar/cambiar_estado/:id_venta/:tipo_producto/:id_producto' => 'preparar#cambiar_estado'

  resources :lotes

  resources :insumos

  resources :merma_materials and resources :merma_material
  #resources :mermas

  get 'mermas/ingresar_merma'

  resources :detalles

  #get 'venta/preparar' => 'preparar#index'
  get 'venta/historial' => 'venta#historial'
  get 'venta/:id/cambiar_estado/:estado_nuevo' => 'venta#cambiar_estado'
  resources :venta do
    get 'index_path'
  end

  resources :ingredientes and resources :ingrediente


  devise_for :users
  devise_scope :user do
    get '/login' => 'devise/sessions#new'
    get '/users/sign_up' => 'devise/registrations#new'
    get '/logout' => 'devise/sessions#destroy'
    #get '/logout' => 'devise/sessions#destroy'
  end
  resources :users, :controller => "user"

  root 'basicos#index'
  resources :alerta_obsolescencia

  resources :compuestos

  resources :basicos

  post ':controller(/:action(/:id(.:format)))'
  get ':controller(/:action(/:id(.:format)))'

  #root 'user_session#sign_in'


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
