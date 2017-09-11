require 'rails_helper'

RSpec.describe "users/index", type: :view do
  before(:each) do
    assign(:users, [
      User.create!(
        :username => "Username",
        :password_digest => "Password Digest",
        :email => "Email",
        :name => "Name",
        :gender => 2,
        :address => "Address",
        :description => "MyText",
        :auth_token => "Auth Token",
        :confirm_token => "Confirm Token",
        :reset_token => "Reset Token",
        :available => false,
        :slug => "Slug",
        :city => "City",
        :district => "District",
        :ward => "Ward"
      ),
      User.create!(
        :username => "Username",
        :password_digest => "Password Digest",
        :email => "Email",
        :name => "Name",
        :gender => 2,
        :address => "Address",
        :description => "MyText",
        :auth_token => "Auth Token",
        :confirm_token => "Confirm Token",
        :reset_token => "Reset Token",
        :available => false,
        :slug => "Slug",
        :city => "City",
        :district => "District",
        :ward => "Ward"
      )
    ])
  end

  it "renders a list of users" do
    render
    assert_select "tr>td", :text => "Username".to_s, :count => 2
    assert_select "tr>td", :text => "Password Digest".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Address".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Auth Token".to_s, :count => 2
    assert_select "tr>td", :text => "Confirm Token".to_s, :count => 2
    assert_select "tr>td", :text => "Reset Token".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "Slug".to_s, :count => 2
    assert_select "tr>td", :text => "City".to_s, :count => 2
    assert_select "tr>td", :text => "District".to_s, :count => 2
    assert_select "tr>td", :text => "Ward".to_s, :count => 2
  end
end
