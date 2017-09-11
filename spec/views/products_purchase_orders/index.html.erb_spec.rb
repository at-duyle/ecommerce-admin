require 'rails_helper'

RSpec.describe "products_purchase_orders/index", type: :view do
  before(:each) do
    assign(:products_purchase_orders, [
      ProductsPurchaseOrder.create!(
        :product => nil,
        :purchase_order => nil,
        :quantity => 2
      ),
      ProductsPurchaseOrder.create!(
        :product => nil,
        :purchase_order => nil,
        :quantity => 2
      )
    ])
  end

  it "renders a list of products_purchase_orders" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
