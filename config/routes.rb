Rails.application.routes.draw do
  root 'main_admin#index'
  resources :requests, only: %i[index show update destroy]
  devise_for :admins, path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    password: 'secret'
  }, controllers: {
    sessions: 'admins/sessions',
    passwords: 'admins/passwords'
  }
  resources :users, only: %i[index show update]
  resources :shops, only: %i[index show update] do
    collection do
      resources :products do
        collection do
          get 'sub/:id', controller: 'products', action: 'sub'
        end
      end
    end
  end
  resources :purchase_orders, only: %i[index show new create destroy] do
    collection do
      post 'product'
      get 'products/:id', controller: 'purchase_orders', action: 'delete_product'
    end
  end
  resources :delivery_orders, only: %i[index show edit update]
  resources :categories
  resources :sub_categories
  resources :admins, only: %i[index show new create update]
  resources :main_admin, only: :index
  resources :revenue, only: :index do
    member do
      get :revenue
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
