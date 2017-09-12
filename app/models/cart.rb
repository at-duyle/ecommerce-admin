class Cart < ApplicationRecord
  belongs_to :user

  # ==============Scopes================
  def self.update_or_create_by(args, attributes)
    obj = find_or_create_by(user_id: args[:user_id])
    obj.update(attributes)
    obj
  end
end
