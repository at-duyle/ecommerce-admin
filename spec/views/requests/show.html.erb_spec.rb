require 'rails_helper'

RSpec.describe "requests/show", type: :view do
  before(:each) do
    @request = assign(:request, Request.create!(
      :name => "Name",
      :email => "Email",
      :phone_number => "Phone Number",
      :shop_name => "Shop Name",
      :shop_address => "Shop Address",
      :latitude => 2.5,
      :longitude => 3.5
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Phone Number/)
    expect(rendered).to match(/Shop Name/)
    expect(rendered).to match(/Shop Address/)
    expect(rendered).to match(/2.5/)
    expect(rendered).to match(/3.5/)
  end
end
