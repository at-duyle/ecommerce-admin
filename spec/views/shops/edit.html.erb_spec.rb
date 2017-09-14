require 'rails_helper'

RSpec.describe "shops/edit", type: :view do
  before(:each) do
    @shop = assign(:shop, Shop.create!(
      :name => "MyString",
      :address => "MyString",
      :phone_number => "MyString",
      :logo => "MyString",
      :latitude => 1.5,
      :longitude => 1.5,
      :available => false,
      :slug => "MyString"
    ))
  end

  it "renders the edit shop form" do
    render

    assert_select "form[action=?][method=?]", shop_path(@shop), "post" do

      assert_select "input[name=?]", "shop[name]"

      assert_select "input[name=?]", "shop[address]"

      assert_select "input[name=?]", "shop[phone_number]"

      assert_select "input[name=?]", "shop[logo]"

      assert_select "input[name=?]", "shop[latitude]"

      assert_select "input[name=?]", "shop[longitude]"

      assert_select "input[name=?]", "shop[available]"

      assert_select "input[name=?]", "shop[slug]"
    end
  end
end
