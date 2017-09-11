require 'rails_helper'

RSpec.describe "users/edit", type: :view do
  before(:each) do
    @user = assign(:user, User.create!(
      :username => "MyString",
      :password_digest => "MyString",
      :email => "MyString",
      :name => "MyString",
      :gender => 1,
      :address => "MyString",
      :description => "MyText",
      :auth_token => "MyString",
      :confirm_token => "MyString",
      :reset_token => "MyString",
      :available => false,
      :slug => "MyString",
      :city => "MyString",
      :district => "MyString",
      :ward => "MyString"
    ))
  end

  it "renders the edit user form" do
    render

    assert_select "form[action=?][method=?]", user_path(@user), "post" do

      assert_select "input[name=?]", "user[username]"

      assert_select "input[name=?]", "user[password_digest]"

      assert_select "input[name=?]", "user[email]"

      assert_select "input[name=?]", "user[name]"

      assert_select "input[name=?]", "user[gender]"

      assert_select "input[name=?]", "user[address]"

      assert_select "textarea[name=?]", "user[description]"

      assert_select "input[name=?]", "user[auth_token]"

      assert_select "input[name=?]", "user[confirm_token]"

      assert_select "input[name=?]", "user[reset_token]"

      assert_select "input[name=?]", "user[available]"

      assert_select "input[name=?]", "user[slug]"

      assert_select "input[name=?]", "user[city]"

      assert_select "input[name=?]", "user[district]"

      assert_select "input[name=?]", "user[ward]"
    end
  end
end
