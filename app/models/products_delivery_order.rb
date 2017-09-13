# == Schema Information
#
# Table name: products_delivery_orders
#
#  id                :integer          not null, primary key
#  product_id        :integer
#  delivery_order_id :integer
#  quantity          :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class ProductsDeliveryOrder < ApplicationRecord
  belongs_to :product
  belongs_to :delivery_order
end
