require 'rails_helper'

RSpec.describe "products/new", type: :view do
  before(:each) do
    assign(:product, Product.new(
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

  it "renders new product form" do
    render

    assert_select "form[action=?][method=?]", products_path, "post" do

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
