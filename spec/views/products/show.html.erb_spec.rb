require 'rails_helper'

RSpec.describe "products/show", type: :view do
  before(:each) do
    @product = assign(:product, Product.create!(
      :name => "Name",
      :producer => "Producer",
      :price => 2.5,
      :quantity => 3,
      :description => "MyText",
      :categorical_type => "Categorical Type",
      :categorical => nil,
      :shop => nil,
      :slug => "Slug",
      :available => false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Producer/)
    expect(rendered).to match(/2.5/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Categorical Type/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/Slug/)
    expect(rendered).to match(/false/)
  end
end
