require 'rails_helper'

RSpec.describe "products_purchase_orders/new", type: :view do
  before(:each) do
    assign(:products_purchase_order, ProductsPurchaseOrder.new(
      :product => nil,
      :purchase_order => nil,
      :quantity => 1
    ))
  end

  it "renders new products_purchase_order form" do
    render

    assert_select "form[action=?][method=?]", products_purchase_orders_path, "post" do

      assert_select "input[name=?]", "products_purchase_order[product_id]"

      assert_select "input[name=?]", "products_purchase_order[purchase_order_id]"

      assert_select "input[name=?]", "products_purchase_order[quantity]"
    end
  end
end
