module ShopsHelper
  # Returns the current shop (if any).
  def current_shop
    @current_shop ||= Shop.find(current_admin.shop_id)
  end
end
