class MainAdminController < ApplicationController
  def index
    @shop_count = Shop.all.count
    @category_count = Category.all.count + SubCategory.all.count
    @product_count = Product.all.count
    @user_count = User.where('available = ?', true).count
    @shops_sells = Shop.shops_sell.to_a
  end
end
