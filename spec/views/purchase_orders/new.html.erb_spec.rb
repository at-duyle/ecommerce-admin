require 'rails_helper'

RSpec.describe "purchase_orders/new", type: :view do
  before(:each) do
    assign(:purchase_order, PurchaseOrder.new(
      :supplier => "MyString",
      :available => false
    ))
  end

  it "renders new purchase_order form" do
    render

    assert_select "form[action=?][method=?]", purchase_orders_path, "post" do

      assert_select "input[name=?]", "purchase_order[supplier]"

      assert_select "input[name=?]", "purchase_order[available]"
    end
  end
end
