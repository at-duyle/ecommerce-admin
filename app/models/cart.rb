# == Schema Information
#
# Table name: carts
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  cart       :json
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Cart < ApplicationRecord
  # ==============Scopes================
  def self.update_or_create_by(args, attributes)
    obj = find_or_create_by(user_id: args[:user_id])
    obj.update(attributes)
    obj
  end
end
