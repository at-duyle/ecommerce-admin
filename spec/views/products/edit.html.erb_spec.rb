require 'rails_helper'

RSpec.describe "products/edit", type: :view do
  before(:each) do
    @product = assign(:product, Product.create!(
      :name => "MyString",
      :producer => "MyString",
      :price => 1.5,
      :quantity => 1,
      :description => "MyText",
      :categorical_type => "MyString",
      :categorical => nil,
      :shop => nil,
      :slug => "MyString",
      :available => false
    ))
  end

  it "renders the edit product form" do
    render

    assert_select "form[action=?][method=?]", product_path(@product), "post" do

      assert_select "input[name=?]", "product[name]"

      assert_select "input[name=?]", "product[producer]"

      assert_select "input[name=?]", "product[price]"

      assert_select "input[name=?]", "product[quantity]"

      assert_select "textarea[name=?]", "product[description]"

      assert_select "input[name=?]", "product[categorical_type]"

      assert_select "input[name=?]", "product[categorical_id]"

      assert_select "input[name=?]", "product[shop_id]"

      assert_select "input[name=?]", "product[slug]"

      assert_select "input[name=?]", "product[available]"
    end
  end
end
