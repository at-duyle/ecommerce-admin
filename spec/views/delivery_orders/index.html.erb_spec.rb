require 'rails_helper'

RSpec.describe "delivery_orders/index", type: :view do
  before(:each) do
    assign(:delivery_orders, [
      DeliveryOrder.create!(
        :user => nil,
        :status => 2,
        :total_price => 3.5,
        :name => "Name",
        :city => "City",
        :district => "District",
        :ward => "Ward",
        :address => "Address",
        :phone => "Phone"
      ),
      DeliveryOrder.create!(
        :user => nil,
        :status => 2,
        :total_price => 3.5,
        :name => "Name",
        :city => "City",
        :district => "District",
        :ward => "Ward",
        :address => "Address",
        :phone => "Phone"
      )
    ])
  end

  it "renders a list of delivery_orders" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.5.to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "City".to_s, :count => 2
    assert_select "tr>td", :text => "District".to_s, :count => 2
    assert_select "tr>td", :text => "Ward".to_s, :count => 2
    assert_select "tr>td", :text => "Address".to_s, :count => 2
    assert_select "tr>td", :text => "Phone".to_s, :count => 2
  end
end
