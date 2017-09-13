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

require 'rails_helper'

RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
