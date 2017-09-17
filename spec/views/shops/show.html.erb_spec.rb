require 'rails_helper'

RSpec.describe "shops/show", type: :view do
  before(:each) do
    @shop = assign(:shop, Shop.create!(
      :name => "Name",
      :address => "Address",
      :phone_number => "Phone Number",
      :logo => "Logo",
      :latitude => 2.5,
      :longitude => 3.5,
      :available => false,
      :slug => "Slug"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Address/)
    expect(rendered).to match(/Phone Number/)
    expect(rendered).to match(/Logo/)
    expect(rendered).to match(/2.5/)
    expect(rendered).to match(/3.5/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/Slug/)
  end
end
