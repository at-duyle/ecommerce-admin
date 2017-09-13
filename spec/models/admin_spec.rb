# == Schema Information
#
# Table name: admins
#
#  id                     :integer          not null, primary key
#  username               :string
#  encrypted_password     :string           default(""), not null
#  email                  :string
#  name                   :string
#  gender                 :integer
#  role                   :integer          default("partner")
#  confirmation_token     :string
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  manager_id             :integer
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  available              :boolean          default(TRUE)
#

require 'rails_helper'

RSpec.describe Admin, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
