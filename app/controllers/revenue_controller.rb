class RevenueController < ApplicationController
  authorize_resource class: false
  skip_load_resource only: :revenue
  skip_authorize_resource only: :revenue
  def index
    @shops = Shop.all
    @shops = @shops.drop(1)
  end

  def revenue
    @out_temp = Shop.shop_out(params[:id])
    @out = Array.new(12) { 0 }
    @out_temp.each do |s|
      @out[s['date_part'] - 1] = s['coalesce']
    end
    @in_temp = Shop.shop_in(params[:id])
    @in = Array.new(12) { 0 }
    @in_temp.each do |s|
      @in[s['date_part'] - 1] = s['coalesce']
    end
    @data = {
      inputs: @in,
      outputs: @out
    }
    render json: @data
  end

  rescue_from CanCan::AccessDenied do |exception|
    if current_admin.nil?
      flash[:error] = "Access denied: #{exception}"
      redirect_to new_admin_session_path
    else
      render file: 'public/403.html', layout: false
    end
  end
end
