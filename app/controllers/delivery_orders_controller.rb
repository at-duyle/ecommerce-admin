class DeliveryOrdersController < ApplicationController
  load_and_authorize_resource
  before_action :set_delivery_order, only: [:show, :edit, :update, :destroy]

  # GET /delivery_orders
  # GET /delivery_orders.json
  def index
    @delivery_orders = DeliveryOrder.all
  end

  # GET /delivery_orders/1
  # GET /delivery_orders/1.json
  def show
  end

  # GET /delivery_orders/1/edit
  def edit
    @status = %w[ordered delivered completed]
  end

  # PATCH/PUT /delivery_orders/1
  # PATCH/PUT /delivery_orders/1.json
  def update
    respond_to do |format|
      if @delivery_order.update(delivery_order_params)
        format.html { redirect_to @delivery_order, notice: { message: 'Delivery order was successfully updated.' } }
        format.json { render :show, status: :ok, location: @delivery_order }
      else
        format.html { render :edit }
        format.json { render json: @delivery_order.errors, status: :unprocessable_entity }
      end
    end
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
  def set_delivery_order
    @delivery_order = DeliveryOrder.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def delivery_order_params
    params.require(:delivery_order).permit(:status)
  end
end
