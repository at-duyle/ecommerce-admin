# == Schema Information
#
# Table name: shops
#
#  id           :integer          not null, primary key
#  name         :string
#  address      :string
#  phone_number :string
#  logo         :string
#  latitude     :float
#  longitude    :float
#  admin_id     :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  available    :boolean          default(TRUE)
#  slug         :string
#

class Shop < ApplicationRecord
  # =============Association=================
  belongs_to :admin
  has_many :products

  # ==============Friendly_url================
  extend FriendlyId
  friendly_id :name, use: :slugged

  def should_generate_new_friendly_id?
    name_changed?
  end

  # ==============Scopes================
  def self.shops_sell
    query = <<-SQL
      SELECT
        shops.name,
        shops.id,
        SUM(delivery_orders.total_price) as sum
      FROM
        public.shops LEFT JOIN public.products ON shops.id = products.id
               LEFT JOIN public.products_delivery_orders ON products.id = products_delivery_orders.product_id
               LEFT JOIN public.delivery_orders ON products_delivery_orders.delivery_order_id = delivery_orders.id
      GROUP BY
        shops.name,
        shops.id
      HAVING
        SUM(delivery_orders.total_price) > 0
      ORDER BY sum DESC
      LIMIT 6
    SQL

    ActiveRecord::Base.connection.execute(query)
  end
end
