require 'rails_helper'

RSpec.describe "admins/index", type: :view do
  before(:each) do
    assign(:admins, [
      Admin.create!(
        :username => "Username",
        :password_digest => "Password Digest",
        :email => "Email",
        :name => "Name",
        :gender => 2,
        :role => 3,
        :auth_token => "Auth Token",
        :confirm_token => "Confirm Token",
        :reset_token => "Reset Token",
        :manager => nil,
        :available => false
      ),
      Admin.create!(
        :username => "Username",
        :password_digest => "Password Digest",
        :email => "Email",
        :name => "Name",
        :gender => 2,
        :role => 3,
        :auth_token => "Auth Token",
        :confirm_token => "Confirm Token",
        :reset_token => "Reset Token",
        :manager => nil,
        :available => false
      )
    ])
  end

  it "renders a list of admins" do
    render
    assert_select "tr>td", :text => "Username".to_s, :count => 2
    assert_select "tr>td", :text => "Password Digest".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => "Auth Token".to_s, :count => 2
    assert_select "tr>td", :text => "Confirm Token".to_s, :count => 2
    assert_select "tr>td", :text => "Reset Token".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
