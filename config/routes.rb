Rails.application.routes.draw do
  devise_for :admins, path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    password: 'secret'
  }, controllers: {
    sessions: 'admins/sessions',
    passwords: 'admins/passwords'
  }
  resources :users
  resources :shops do
    collection do
      resources :products do
        collection do
          get 'sub/:id', controller: 'products', action: 'sub'
        end
      end
    end
  end
  resources :purchase_orders
  resources :products_purchase_orders
  resources :products_delivery_orders
  resources :images
  resources :delivery_orders
  resources :comments
  resources :categories do
    resources :sub_categories do
      collection do
        get 'sub'
      end
    end
  end
  resources :carts
  # resources :admins
  resources :main_admin, only: :index
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
