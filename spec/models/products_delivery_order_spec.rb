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

require 'rails_helper'

RSpec.describe ProductsDeliveryOrder, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
