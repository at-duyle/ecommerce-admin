require 'rails_helper'

RSpec.describe "purchase_orders/edit", type: :view do
  before(:each) do
    @purchase_order = assign(:purchase_order, PurchaseOrder.create!(
      :supplier => "MyString",
      :available => false
    ))
  end

  it "renders the edit purchase_order form" do
    render

    assert_select "form[action=?][method=?]", purchase_order_path(@purchase_order), "post" do

      assert_select "input[name=?]", "purchase_order[supplier]"

      assert_select "input[name=?]", "purchase_order[available]"
    end
  end
end
