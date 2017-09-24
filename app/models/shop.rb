class Shop < ApplicationRecord
  # =============Association=================
  has_many :admins
  has_one :admin
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
    WHERE shops.name != ''
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

  def self.shop_out(shops_id)
    query = "
    SELECT date_part('month', delivery_orders.created_at), coalesce(SUM(delivery_orders.total_price), 0)
    FROM
    public.shops LEFT JOIN public.products ON shops.id = products.id
    LEFT JOIN public.products_delivery_orders ON products.id = products_delivery_orders.product_id
    LEFT JOIN public.delivery_orders ON products_delivery_orders.delivery_order_id = delivery_orders.id
    WHERE shops.id = #{shops_id} AND date_part('year', delivery_orders.created_at) = date_part('year', CURRENT_DATE)
    GROUP BY date_part('month', delivery_orders.created_at)
    "
    ActiveRecord::Base.connection.execute(query, shops_id: shops_id).to_a
  end

  def self.shop_in(shops_id)
    query = "
    SELECT date_part('month', purchase_orders.created_at), coalesce(SUM(purchase_orders.total_price), 0)
    FROM
    public.shops LEFT JOIN public.products ON shops.id = products.id
    LEFT JOIN public.products_purchase_orders ON products.id = products_purchase_orders.product_id
    LEFT JOIN public.purchase_orders ON products_purchase_orders.purchase_order_id = purchase_orders.id
    WHERE shops.id = #{shops_id} AND date_part('year', purchase_orders.created_at) = date_part('year', CURRENT_DATE)
    GROUP BY date_part('month', purchase_orders.created_at)
    "
    ActiveRecord::Base.connection.execute(query, shops_id: shops_id).to_a
  end
end
