# == Schema Information
#
# Table name: products
#
#  id               :integer          not null, primary key
#  name             :string
#  producer         :string
#  price            :float
#  quantity         :integer
#  description      :text
#  categorical_type :string
#  categorical_id   :integer
#  shop_id          :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  slug             :string
#  available        :boolean          default(TRUE)
#

class Product < ApplicationRecord
  # =============Association================

  has_many :comments
  has_many :users, through: :comments

  has_many :products_purchase_orders
  has_many :purchase_orders, through: :products_purchase_orders

  has_many :products_delivery_orders
  has_many :delivery_orders, through: :products_delivery_orders

  has_many :images
  has_one :image
  belongs_to :categorical, polymorphic: true
  belongs_to :shop

  # ==============Attributes================
  attr_accessor :message

  # ==============Friendly_url================
  extend FriendlyId
  friendly_id :name, use: :slugged

  def should_generate_new_friendly_id?
    name_changed?
  end

  # ==============Scopes================
  def self.best_seller
    where(id: ProductsDeliveryOrder.left_joins(:product)
     .where('products.available = true')
     .group('products.id')
     .order('COUNT(products.id) DESC')
     .select('products.id').take(10), available: true)
  end
end
