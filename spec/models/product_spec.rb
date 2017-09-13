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

require 'rails_helper'

RSpec.describe Product, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
