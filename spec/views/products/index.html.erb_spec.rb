require 'rails_helper'

RSpec.describe "products/index", type: :view do
  before(:each) do
    assign(:products, [
      Product.create!(
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
      ),
      Product.create!(
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
      )
    ])
  end

  it "renders a list of products" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Producer".to_s, :count => 2
    assert_select "tr>td", :text => 2.5.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Categorical Type".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Slug".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
