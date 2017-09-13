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

require 'rails_helper'

RSpec.describe ProductsPurchaseOrder, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
