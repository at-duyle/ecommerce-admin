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
end
