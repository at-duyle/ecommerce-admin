require 'rails_helper'

RSpec.describe "products_delivery_orders/show", type: :view do
  before(:each) do
    @products_delivery_order = assign(:products_delivery_order, ProductsDeliveryOrder.create!(
      :product => nil,
      :delivery_order => nil,
      :quantity => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/2/)
  end
end
