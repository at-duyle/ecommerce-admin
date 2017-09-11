require 'rails_helper'

RSpec.describe "products_purchase_orders/show", type: :view do
  before(:each) do
    @products_purchase_order = assign(:products_purchase_order, ProductsPurchaseOrder.create!(
      :product => nil,
      :purchase_order => nil,
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
