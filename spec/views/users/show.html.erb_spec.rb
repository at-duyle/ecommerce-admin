require 'rails_helper'

RSpec.describe "users/show", type: :view do
  before(:each) do
    @user = assign(:user, User.create!(
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
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Username/)
    expect(rendered).to match(/Password Digest/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Address/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Auth Token/)
    expect(rendered).to match(/Confirm Token/)
    expect(rendered).to match(/Reset Token/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/Slug/)
    expect(rendered).to match(/City/)
    expect(rendered).to match(/District/)
    expect(rendered).to match(/Ward/)
  end
end
