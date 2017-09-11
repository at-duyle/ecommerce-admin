require 'rails_helper'

RSpec.describe "products_delivery_orders/new", type: :view do
  before(:each) do
    assign(:products_delivery_order, ProductsDeliveryOrder.new(
      :product => nil,
      :delivery_order => nil,
      :quantity => 1
    ))
  end

  it "renders new products_delivery_order form" do
    render

    assert_select "form[action=?][method=?]", products_delivery_orders_path, "post" do

      assert_select "input[name=?]", "products_delivery_order[product_id]"

      assert_select "input[name=?]", "products_delivery_order[delivery_order_id]"

      assert_select "input[name=?]", "products_delivery_order[quantity]"
    end
  end
end
