require 'rails_helper'

RSpec.describe "products_delivery_orders/index", type: :view do
  before(:each) do
    assign(:products_delivery_orders, [
      ProductsDeliveryOrder.create!(
        :product => nil,
        :delivery_order => nil,
        :quantity => 2
      ),
      ProductsDeliveryOrder.create!(
        :product => nil,
        :delivery_order => nil,
        :quantity => 2
      )
    ])
  end

  it "renders a list of products_delivery_orders" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
