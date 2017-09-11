require 'rails_helper'

RSpec.describe "shops/new", type: :view do
  before(:each) do
    assign(:shop, Shop.new(
      :name => "MyString",
      :address => "MyString",
      :phone_number => "MyString",
      :logo => "MyString",
      :latitude => 1.5,
      :longitude => 1.5,
      :admin => nil,
      :available => false,
      :slug => "MyString"
    ))
  end

  it "renders new shop form" do
    render

    assert_select "form[action=?][method=?]", shops_path, "post" do

      assert_select "input[name=?]", "shop[name]"

      assert_select "input[name=?]", "shop[address]"

      assert_select "input[name=?]", "shop[phone_number]"

      assert_select "input[name=?]", "shop[logo]"

      assert_select "input[name=?]", "shop[latitude]"

      assert_select "input[name=?]", "shop[longitude]"

      assert_select "input[name=?]", "shop[admin_id]"

      assert_select "input[name=?]", "shop[available]"

      assert_select "input[name=?]", "shop[slug]"
    end
  end
end
