class PurchaseOrder < ApplicationRecord
  has_many :products_purchase_orders
  has_many :products, through: :products_purchase_orders
end
