# == Schema Information
#
# Table name: sub_categories
#
#  id          :integer          not null, primary key
#  name        :string
#  category_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  slug        :string
#

require 'rails_helper'

RSpec.describe SubCategory, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
