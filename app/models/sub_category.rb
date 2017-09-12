class SubCategory < ApplicationRecord
  belongs_to :category
  has_many :products, as: :categorical

  # ==============Friendly_url===============
  extend FriendlyId
  friendly_id :name, use: :slugged

  def should_generate_new_friendly_id?
    name_changed?
  end
end
