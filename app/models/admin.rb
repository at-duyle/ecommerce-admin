# == Schema Information
#
# Table name: admins
#
#  id              :integer          not null, primary key
#  username        :string
#  password_digest :string
#  email           :string
#  name            :string
#  gender          :integer
#  role            :integer          default("partner")
#  auth_token      :string
#  confirm_send_at :datetime
#  confirm_token   :string
#  confirm_at      :datetime
#  reset_send_at   :datetime
#  reset_token     :string
#  manager_id      :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  available       :boolean          default(TRUE)
#

class Admin < ApplicationRecord
  # ================Association=====================

  # setup self_join for table admin.
  # we can retieve @admin.partner and @admin.manager
  has_many :partner, class_name: 'Admin', foreign_key: 'manager_id'
  belongs_to :manager, class_name: 'Admin', optional: true

  has_many :shops

  # ================ENUMS=====================

  enum role: %w[admin manager partner]
  enum gender: %w[male female other]
  # ================Validates=====================
end
