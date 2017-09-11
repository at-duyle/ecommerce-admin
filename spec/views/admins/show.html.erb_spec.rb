require 'rails_helper'

RSpec.describe "admins/show", type: :view do
  before(:each) do
    @admin = assign(:admin, Admin.create!(
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
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Username/)
    expect(rendered).to match(/Password Digest/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/Auth Token/)
    expect(rendered).to match(/Confirm Token/)
    expect(rendered).to match(/Reset Token/)
    expect(rendered).to match(//)
    expect(rendered).to match(/false/)
  end
end
