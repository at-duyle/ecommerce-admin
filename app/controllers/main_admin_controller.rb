class MainAdminController < ApplicationController
  authorize_resource class: false
  def index
    @shop_count = Shop.all.count - 1
    @category_count = Category.all.count + SubCategory.all.count
    @product_count = Product.all.count
    @user_count = User.where('available = ?', true).count
    @shops_sells = Shop.shops_sell.to_a
  end
  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = "Access denied: #{exception}"
    redirect_to new_admin_session_path
  end
end
