class ProductsDeliveryOrdersController < ApplicationController
  before_action :set_products_delivery_order, only: [:show, :edit, :update, :destroy]

  # GET /products_delivery_orders
  # GET /products_delivery_orders.json
  def index
    @products_delivery_orders = ProductsDeliveryOrder.all
  end

  # GET /products_delivery_orders/1
  # GET /products_delivery_orders/1.json
  def show
  end

  # GET /products_delivery_orders/new
  def new
    @products_delivery_order = ProductsDeliveryOrder.new
  end

  # GET /products_delivery_orders/1/edit
  def edit
  end

  # POST /products_delivery_orders
  # POST /products_delivery_orders.json
  def create
    @products_delivery_order = ProductsDeliveryOrder.new(products_delivery_order_params)

    respond_to do |format|
      if @products_delivery_order.save
        format.html { redirect_to @products_delivery_order, notice: 'Products delivery order was successfully created.' }
        format.json { render :show, status: :created, location: @products_delivery_order }
      else
        format.html { render :new }
        format.json { render json: @products_delivery_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products_delivery_orders/1
  # PATCH/PUT /products_delivery_orders/1.json
  def update
    respond_to do |format|
      if @products_delivery_order.update(products_delivery_order_params)
        format.html { redirect_to @products_delivery_order, notice: 'Products delivery order was successfully updated.' }
        format.json { render :show, status: :ok, location: @products_delivery_order }
      else
        format.html { render :edit }
        format.json { render json: @products_delivery_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products_delivery_orders/1
  # DELETE /products_delivery_orders/1.json
  def destroy
    @products_delivery_order.destroy
    respond_to do |format|
      format.html { redirect_to products_delivery_orders_url, notice: 'Products delivery order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_products_delivery_order
      @products_delivery_order = ProductsDeliveryOrder.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def products_delivery_order_params
      params.require(:products_delivery_order).permit(:product_id, :delivery_order_id, :quantity)
    end
end
