# == Schema Information
#
# Table name: delivery_orders
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  status      :integer          default(0)
#  total_price :float
#  name        :string
#  city        :string
#  district    :string
#  ward        :string
#  address     :string
#  phone       :string
#

require 'rails_helper'

RSpec.describe DeliveryOrder, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
