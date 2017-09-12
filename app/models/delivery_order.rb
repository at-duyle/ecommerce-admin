class DeliveryOrder < ApplicationRecord
  belongs_to :user
  has_many :products_delivery_orders
  has_many :products, through: :products_delivery_orders

  # ===================Enum==========================
  enum status: %w[ordered delivered completed]
end
