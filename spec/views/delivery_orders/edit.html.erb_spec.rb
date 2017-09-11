require 'rails_helper'

RSpec.describe "delivery_orders/edit", type: :view do
  before(:each) do
    @delivery_order = assign(:delivery_order, DeliveryOrder.create!(
      :user => nil,
      :status => 1,
      :total_price => 1.5,
      :name => "MyString",
      :city => "MyString",
      :district => "MyString",
      :ward => "MyString",
      :address => "MyString",
      :phone => "MyString"
    ))
  end

  it "renders the edit delivery_order form" do
    render

    assert_select "form[action=?][method=?]", delivery_order_path(@delivery_order), "post" do

      assert_select "input[name=?]", "delivery_order[user_id]"

      assert_select "input[name=?]", "delivery_order[status]"

      assert_select "input[name=?]", "delivery_order[total_price]"

      assert_select "input[name=?]", "delivery_order[name]"

      assert_select "input[name=?]", "delivery_order[city]"

      assert_select "input[name=?]", "delivery_order[district]"

      assert_select "input[name=?]", "delivery_order[ward]"

      assert_select "input[name=?]", "delivery_order[address]"

      assert_select "input[name=?]", "delivery_order[phone]"
    end
  end
end
