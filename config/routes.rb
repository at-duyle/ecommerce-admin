Rails.application.routes.draw do
  resources :users
  resources :sub_categories
  resources :shops
  resources :purchase_orders
  resources :products_purchase_orders
  resources :products_delivery_orders
  resources :products
  resources :images
  resources :delivery_orders
  resources :comments
  resources :categories
  resources :carts
  resources :admins
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
