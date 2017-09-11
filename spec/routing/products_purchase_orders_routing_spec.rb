require "rails_helper"

RSpec.describe ProductsPurchaseOrdersController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/products_purchase_orders").to route_to("products_purchase_orders#index")
    end

    it "routes to #new" do
      expect(:get => "/products_purchase_orders/new").to route_to("products_purchase_orders#new")
    end

    it "routes to #show" do
      expect(:get => "/products_purchase_orders/1").to route_to("products_purchase_orders#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/products_purchase_orders/1/edit").to route_to("products_purchase_orders#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/products_purchase_orders").to route_to("products_purchase_orders#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/products_purchase_orders/1").to route_to("products_purchase_orders#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/products_purchase_orders/1").to route_to("products_purchase_orders#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/products_purchase_orders/1").to route_to("products_purchase_orders#destroy", :id => "1")
    end

  end
end
