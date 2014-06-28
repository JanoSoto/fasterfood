Rails.application.routes.draw do
  get 'recepcion_materiales/insumos'

  get 'recepcion_materiales/ingredientes'

  resources :merma_ingredientes

  resources :merma_insumos

  resources :lotes

  resources :insumos

  resources :merma_materials and resources :merma_material
  #resources :mermas

  get 'mermas/ingresar_merma'

  resources :detalles

  get 'venta/preparar' => 'venta#preparar'
  get 'venta/:id/cambiar_estado/:estado_nuevo' => 'venta#cambiar_estado'
  resources :venta do
    get 'index_path'
  end

  resources :vendedors

  resources :ingredientes and resources :ingrediente

  devise_for :users
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
