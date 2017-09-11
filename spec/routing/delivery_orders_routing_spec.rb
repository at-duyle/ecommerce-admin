require "rails_helper"

RSpec.describe DeliveryOrdersController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/delivery_orders").to route_to("delivery_orders#index")
    end

    it "routes to #new" do
      expect(:get => "/delivery_orders/new").to route_to("delivery_orders#new")
    end

    it "routes to #show" do
      expect(:get => "/delivery_orders/1").to route_to("delivery_orders#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/delivery_orders/1/edit").to route_to("delivery_orders#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/delivery_orders").to route_to("delivery_orders#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/delivery_orders/1").to route_to("delivery_orders#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/delivery_orders/1").to route_to("delivery_orders#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/delivery_orders/1").to route_to("delivery_orders#destroy", :id => "1")
    end

  end
end
