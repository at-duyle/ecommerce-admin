# == Schema Information
#
# Table name: delivery_orders
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  status      :integer          default("ordered")
#  total_price :float
#  name        :string
#  city        :string
#  district    :string
#  ward        :string
#  address     :string
#  phone       :string
#

class DeliveryOrder < ApplicationRecord
  # ====================Association=====================
  belongs_to :user

  has_many :products_delivery_orders
  has_many :products, through: :products_delivery_orders

  # ===================Enum==========================
  enum status: %w[ordered delivered completed]
end
