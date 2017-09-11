require 'rails_helper'

RSpec.describe "shops/index", type: :view do
  before(:each) do
    assign(:shops, [
      Shop.create!(
        :name => "Name",
        :address => "Address",
        :phone_number => "Phone Number",
        :logo => "Logo",
        :latitude => 2.5,
        :longitude => 3.5,
        :admin => nil,
        :available => false,
        :slug => "Slug"
      ),
      Shop.create!(
        :name => "Name",
        :address => "Address",
        :phone_number => "Phone Number",
        :logo => "Logo",
        :latitude => 2.5,
        :longitude => 3.5,
        :admin => nil,
        :available => false,
        :slug => "Slug"
      )
    ])
  end

  it "renders a list of shops" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Address".to_s, :count => 2
    assert_select "tr>td", :text => "Phone Number".to_s, :count => 2
    assert_select "tr>td", :text => "Logo".to_s, :count => 2
    assert_select "tr>td", :text => 2.5.to_s, :count => 2
    assert_select "tr>td", :text => 3.5.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "Slug".to_s, :count => 2
  end
end
