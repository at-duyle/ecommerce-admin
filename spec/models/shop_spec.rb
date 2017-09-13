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

require 'rails_helper'

RSpec.describe Shop, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
