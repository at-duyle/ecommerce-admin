require 'rails_helper'

RSpec.describe "purchase_orders/show", type: :view do
  before(:each) do
    @purchase_order = assign(:purchase_order, PurchaseOrder.create!(
      :supplier => "Supplier",
      :available => false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Supplier/)
    expect(rendered).to match(/false/)
  end
end
