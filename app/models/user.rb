# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string
#  password_digest :string
#  email           :string
#  name            :string
#  gender          :integer
#  address         :string
#  description     :text
#  auth_token      :string
#  confirm_send_at :datetime
#  confirm_token   :string
#  confirm_at      :datetime
#  reset_send_at   :datetime
#  reset_token     :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  available       :boolean          default(TRUE)
#  slug            :string
#  city            :string
#  district        :string
#  ward            :string
#

class User < ApplicationRecord
  has_secure_password

  # ================Association=====================
  has_many :comments
  has_many :products, through: :comments
  has_many :delivery_orders
  has_one :cart

  # ================ENUMS=====================
  enum gender: %w[male female other]

  # ================Validates=====================
  validates :username, :email, presence: true
  validates :password_confirmation, presence: true, on: %i[create update],
                                    unless: :skip_password_validation
  validates :username, :email, uniqueness: true
  validates_confirmation_of :password
  validates_format_of :email, with: /\w+@\w+\.{1}[a-zA-Z]{2,}/

  # ==============Attr-Accessor===============
  attr_accessor :skip_password_validation

  # ==============Friendly_url================
  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged

  def slug_candidates
    [
      :username,
      %i[name username]
    ]
  end

  def should_generate_new_friendly_id?
    name_changed? || username_changed?
  end
end
