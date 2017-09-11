require 'rails_helper'

RSpec.describe "purchase_orders/index", type: :view do
  before(:each) do
    assign(:purchase_orders, [
      PurchaseOrder.create!(
        :supplier => "Supplier",
        :available => false
      ),
      PurchaseOrder.create!(
        :supplier => "Supplier",
        :available => false
      )
    ])
  end

  it "renders a list of purchase_orders" do
    render
    assert_select "tr>td", :text => "Supplier".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
