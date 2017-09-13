# == Schema Information
#
# Table name: products_purchase_orders
#
#  id                :integer          not null, primary key
#  product_id        :integer
#  purchase_order_id :integer
#  quantity          :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class ProductsPurchaseOrder < ApplicationRecord
  belongs_to :product
  belongs_to :purchase_order
end
