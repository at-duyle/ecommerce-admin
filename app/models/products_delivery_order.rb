class ProductsDeliveryOrder < ApplicationRecord
  belongs_to :product
  belongs_to :delivery_order
end
