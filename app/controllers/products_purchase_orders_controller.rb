class ProductsPurchaseOrdersController < ApplicationController
  before_action :set_products_purchase_order, only: [:show, :edit, :update, :destroy]

  # GET /products_purchase_orders
  # GET /products_purchase_orders.json
  def index
    @products_purchase_orders = ProductsPurchaseOrder.all
  end

  # GET /products_purchase_orders/1
  # GET /products_purchase_orders/1.json
  def show
  end

  # GET /products_purchase_orders/new
  def new
    @products_purchase_order = ProductsPurchaseOrder.new
  end

  # GET /products_purchase_orders/1/edit
  def edit
  end

  # POST /products_purchase_orders
  # POST /products_purchase_orders.json
  def create
    @products_purchase_order = ProductsPurchaseOrder.new(products_purchase_order_params)

    respond_to do |format|
      if @products_purchase_order.save
        format.html { redirect_to @products_purchase_order, notice: 'Products purchase order was successfully created.' }
        format.json { render :show, status: :created, location: @products_purchase_order }
      else
        format.html { render :new }
        format.json { render json: @products_purchase_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products_purchase_orders/1
  # PATCH/PUT /products_purchase_orders/1.json
  def update
    respond_to do |format|
      if @products_purchase_order.update(products_purchase_order_params)
        format.html { redirect_to @products_purchase_order, notice: 'Products purchase order was successfully updated.' }
        format.json { render :show, status: :ok, location: @products_purchase_order }
      else
        format.html { render :edit }
        format.json { render json: @products_purchase_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products_purchase_orders/1
  # DELETE /products_purchase_orders/1.json
  def destroy
    @products_purchase_order.destroy
    respond_to do |format|
      format.html { redirect_to products_purchase_orders_url, notice: 'Products purchase order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_products_purchase_order
      @products_purchase_order = ProductsPurchaseOrder.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def products_purchase_order_params
      params.require(:products_purchase_order).permit(:product_id, :purchase_order_id, :quantity)
    end
end