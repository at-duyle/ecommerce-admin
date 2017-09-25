class RequestsController < ApplicationController
  before_action :set_request, only: [:show, :edit, :update, :destroy]

  # GET /requests
  # GET /requests.json
  def index
    @requests = Request.all
  end

  # GET /requests/1
  # GET /requests/1.json
  def show
  end

  # POST /requests
  # POST /requests.json
  def update
    ActiveRecord::Base.transaction do
      shop = Shop.create!(name: @request.shop_name, address: @request.shop_address,
                          phone_number: @request.phone_number, latitude: @request.latitude,
                          longitude: @request.longitude, available: true)
      admin = Admin.create!(username: @request.name, email: @request.email, name: @request.name,
                            gender: 2, role: 1, shop_id: shop.id, password: 123456)
      @request.destroy
      ConfirmRequestMailer.confirm_request(admin).deliver_later
      redirect_to requests_path, notice: { message: 'Create new shop and admin successfully!' }
    end
  rescue ActiveRecord::RecordInvalid => exception
    redirect_to @request, notice: { errors: exception.record.errors.full_messages }
  end

  # DELETE /requests/1
  # DELETE /requests/1.json
  def destroy
    ConfirmRequestMailer.refuse_request(@request).deliver_later
    respond_to do |format|
      format.html { redirect_to requests_url, notice: { message: 'Request was refused.' } }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_request
    @request = Request.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def request_params
    params.require(:request).permit(:name, :email, :phone_number, :shop_name, :shop_address, :latitude, :longitude)
  end
end
