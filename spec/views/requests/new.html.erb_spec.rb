require 'rails_helper'

RSpec.describe "requests/new", type: :view do
  before(:each) do
    assign(:request, Request.new(
      :name => "MyString",
      :email => "MyString",
      :phone_number => "MyString",
      :shop_name => "MyString",
      :shop_address => "MyString",
      :latitude => 1.5,
      :longitude => 1.5
    ))
  end

  it "renders new request form" do
    render

    assert_select "form[action=?][method=?]", requests_path, "post" do

      assert_select "input[name=?]", "request[name]"

      assert_select "input[name=?]", "request[email]"

      assert_select "input[name=?]", "request[phone_number]"

      assert_select "input[name=?]", "request[shop_name]"

      assert_select "input[name=?]", "request[shop_address]"

      assert_select "input[name=?]", "request[latitude]"

      assert_select "input[name=?]", "request[longitude]"
    end
  end
end
