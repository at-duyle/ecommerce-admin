require 'rails_helper'

RSpec.describe "ProductsPurchaseOrders", type: :request do
  describe "GET /products_purchase_orders" do
    it "works! (now write some real specs)" do
      get products_purchase_orders_path
      expect(response).to have_http_status(200)
    end
  end
end
