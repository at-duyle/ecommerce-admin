require 'rails_helper'

RSpec.describe "products_delivery_orders/edit", type: :view do
  before(:each) do
    @products_delivery_order = assign(:products_delivery_order, ProductsDeliveryOrder.create!(
      :product => nil,
      :delivery_order => nil,
      :quantity => 1
    ))
  end

  it "renders the edit products_delivery_order form" do
    render

    assert_select "form[action=?][method=?]", products_delivery_order_path(@products_delivery_order), "post" do

      assert_select "input[name=?]", "products_delivery_order[product_id]"

      assert_select "input[name=?]", "products_delivery_order[delivery_order_id]"

      assert_select "input[name=?]", "products_delivery_order[quantity]"
    end
  end
end
