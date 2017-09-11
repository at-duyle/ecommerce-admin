require 'rails_helper'

RSpec.describe "delivery_orders/show", type: :view do
  before(:each) do
    @delivery_order = assign(:delivery_order, DeliveryOrder.create!(
      :user => nil,
      :status => 2,
      :total_price => 3.5,
      :name => "Name",
      :city => "City",
      :district => "District",
      :ward => "Ward",
      :address => "Address",
      :phone => "Phone"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3.5/)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/City/)
    expect(rendered).to match(/District/)
    expect(rendered).to match(/Ward/)
    expect(rendered).to match(/Address/)
    expect(rendered).to match(/Phone/)
  end
end
