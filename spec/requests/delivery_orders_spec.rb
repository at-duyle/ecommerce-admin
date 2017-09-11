require 'rails_helper'

RSpec.describe "DeliveryOrders", type: :request do
  describe "GET /delivery_orders" do
    it "works! (now write some real specs)" do
      get delivery_orders_path
      expect(response).to have_http_status(200)
    end
  end
end
