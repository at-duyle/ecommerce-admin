require 'rails_helper'

RSpec.describe "sub_categories/new", type: :view do
  before(:each) do
    assign(:sub_category, SubCategory.new(
      :name => "MyString",
      :category => nil,
      :slug => "MyString"
    ))
  end

  it "renders new sub_category form" do
    render

    assert_select "form[action=?][method=?]", sub_categories_path, "post" do

      assert_select "input[name=?]", "sub_category[name]"

      assert_select "input[name=?]", "sub_category[category_id]"

      assert_select "input[name=?]", "sub_category[slug]"
    end
  end
end
