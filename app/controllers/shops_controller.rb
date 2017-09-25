class ShopsController < ApplicationController
  load_and_authorize_resource find_by: :slug
  before_action :set_shop, only: [:show, :edit, :update, :destroy]

  # GET /shops
  # GET /shops.json
  def index
    @shops = Shop.all
    @shops = @shops.drop(1)
  end

  # GET /shops/1
  # GET /shops/1.json
  def show
    @managers = @shop.admins
  end

  # PATCH/PUT /shops/1
  # PATCH/PUT /shops/1.json
  def update
    if @shop.update!(available: !@shop.available)
      @managers = @shop.admins
      @managers.each do |manager|
        manager.update(available: @shop.available)
      end
      if !@shop.available
        redirect_to @shop, notice: { message: 'Shop was successfully locked.' }
      else
        redirect_to @shop, notice: { message: 'Shop was successfully unlocked.' }
      end
    else
      if !@shop.available
        redirect_to @shop, notice: { errors: 'Shop was unsuccessfully locked.' }
      else
        redirect_to @shop, notice: { errors: 'Shop was unsuccessfully unlocked.' }
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
  def set_shop
    @shop = Shop.friendly.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def shop_params
    params.require(:shop).permit(:name, :address, :phone_number, :logo, :latitude, :longitude, :available, :slug)
  end
end
