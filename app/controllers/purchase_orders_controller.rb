class PurchaseOrdersController < ApplicationController
  load_and_authorize_resource
  before_action :set_purchase_order, only: [:show, :destroy], except: [:delete_product]

  # GET /purchase_orders
  # GET /purchase_orders.json
  def index
    @purchase_orders = PurchaseOrder.all
  end

  # GET /purchase_orders/1
  # GET /purchase_orders/1.json
  def show
  end

  # GET /purchase_orders/new
  def new
    @products = Product.where(shop_id: current_shop.id)
    @purchase_order = PurchaseOrder.new
    @products_purchase_order = ProductsPurchaseOrder.new
  end

  # POST /purchase_orders
  # POST /purchase_orders.json
  def create
    ActiveRecord::Base.transaction do
      @purchase_order = PurchaseOrder.create!(purchase_order_params)
      sum = 0
      @list = list_product
      @list.each do |product|
        ProductsPurchaseOrder.create!(product_id: product['product_id'], purchase_order_id: @purchase_order.id,
                                      quantity: product['quantity'])
        sum += product['quantity'].to_i * product['price'].to_f
      end
      @purchase_order.update(total_price: sum)
      session[:list_product] = nil
      redirect_to purchase_orders_path, notice: { message: 'Add purchase order sucessfully!' }
    end
  rescue ActiveRecord::RecordInvalid => exception
    redirect_to new_purchase_order_path, notice: { errors: exception.record.errors.full_messages }
  end

  # DELETE /purchase_orders/1
  # DELETE /purchase_orders/1.json
  def destroy
    ActiveRecord::Base.transaction do
      details = @purchase_order.products_purchase_orders
      details.each { |detail| detail.destroy }
      @purchase_order.destroy
      respond_to do |format|
        format.html { redirect_to purchase_orders_url, notice: { message: 'Purchase order was successfully destroyed.' } }
        format.json { head :no_content }
      end
    end
  rescue ActiveRecord::RecordInvalid => exception
    redirect_to @request, notice: { errors: exception.record.errors.full_messages }
  end

  def product
    add_product(product_params)
    redirect_to new_purchase_order_path
  end

  def delete_product
    delete_products(params[:id])
    redirect_to new_purchase_order_path
  end

  rescue_from CanCan::AccessDenied do |exception|
    if current_admin.nil?
      flash[:error] = "Access denied: #{exception}"
      redirect_to new_admin_session_path
    else
      render file: 'public/403.html', layout: false
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_purchase_order
    @purchase_order = PurchaseOrder.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def purchase_order_params
    params.require(:purchase_order).permit(:supplier, :available)
  end

  def product_params
    params.require(:products_purchase_order).permit(:product_id, :quantity)
  end
end
