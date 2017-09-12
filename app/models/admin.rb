class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :recoverable, :validatable
  # :registerable, :rememberable, :trackable,

  # ================Association=====================

  # setup self_join for table admin.
  # we can retieve @admin.partner and @admin.manager
  has_many :partner, class_name: 'Admin', foreign_key: 'manager_id'
  belongs_to :manager, class_name: 'Admin', optional: true

  has_many :shops

  # ================ENUMS=====================

  enum role: %w[admin manager partner]
  enum gender: %w[male female other]

end
