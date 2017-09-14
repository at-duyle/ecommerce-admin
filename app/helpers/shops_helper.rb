module ShopsHelper
  # Returns the current shop (if any).
  def current_shop
    @current_shop ||= Shop.find_by(admin_id: current_admin.id)
  end
end
