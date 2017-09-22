require 'rails_helper'

RSpec.describe "requests/index", type: :view do
  before(:each) do
    assign(:requests, [
      Request.create!(
        :name => "Name",
        :email => "Email",
        :phone_number => "Phone Number",
        :shop_name => "Shop Name",
        :shop_address => "Shop Address",
        :latitude => 2.5,
        :longitude => 3.5
      ),
      Request.create!(
        :name => "Name",
        :email => "Email",
        :phone_number => "Phone Number",
        :shop_name => "Shop Name",
        :shop_address => "Shop Address",
        :latitude => 2.5,
        :longitude => 3.5
      )
    ])
  end

  it "renders a list of requests" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Phone Number".to_s, :count => 2
    assert_select "tr>td", :text => "Shop Name".to_s, :count => 2
    assert_select "tr>td", :text => "Shop Address".to_s, :count => 2
    assert_select "tr>td", :text => 2.5.to_s, :count => 2
    assert_select "tr>td", :text => 3.5.to_s, :count => 2
  end
end
