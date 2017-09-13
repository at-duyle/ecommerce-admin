# == Schema Information
#
# Table name: purchase_orders
#
#  id         :integer          not null, primary key
#  supplier   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  available  :boolean          default(TRUE)
#

require 'rails_helper'

RSpec.describe PurchaseOrder, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
