require 'rails_helper'

RSpec.describe "products_purchase_orders/edit", type: :view do
  before(:each) do
    @products_purchase_order = assign(:products_purchase_order, ProductsPurchaseOrder.create!(
      :product => nil,
      :purchase_order => nil,
      :quantity => 1
    ))
  end

  it "renders the edit products_purchase_order form" do
    render

    assert_select "form[action=?][method=?]", products_purchase_order_path(@products_purchase_order), "post" do

      assert_select "input[name=?]", "products_purchase_order[product_id]"

      assert_select "input[name=?]", "products_purchase_order[purchase_order_id]"

      assert_select "input[name=?]", "products_purchase_order[quantity]"
    end
  end
end
