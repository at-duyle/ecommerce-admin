require 'rails_helper'

RSpec.describe "admins/edit", type: :view do
  before(:each) do
    @admin = assign(:admin, Admin.create!(
      :username => "MyString",
      :password_digest => "MyString",
      :email => "MyString",
      :name => "MyString",
      :gender => 1,
      :role => 1,
      :auth_token => "MyString",
      :confirm_token => "MyString",
      :reset_token => "MyString",
      :manager => nil,
      :available => false
    ))
  end

  it "renders the edit admin form" do
    render

    assert_select "form[action=?][method=?]", admin_path(@admin), "post" do

      assert_select "input[name=?]", "admin[username]"

      assert_select "input[name=?]", "admin[password_digest]"

      assert_select "input[name=?]", "admin[email]"

      assert_select "input[name=?]", "admin[name]"

      assert_select "input[name=?]", "admin[gender]"

      assert_select "input[name=?]", "admin[role]"

      assert_select "input[name=?]", "admin[auth_token]"

      assert_select "input[name=?]", "admin[confirm_token]"

      assert_select "input[name=?]", "admin[reset_token]"

      assert_select "input[name=?]", "admin[manager_id]"

      assert_select "input[name=?]", "admin[available]"
    end
  end
end
