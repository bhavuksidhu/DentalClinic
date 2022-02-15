require 'rails_helper'

RSpec.describe "managers/new", type: :view do
  before(:each) do
    assign(:manager, Manager.new(
      first_name: "MyString",
      last_name: "MyString",
      user: nil
    ))
  end

  it "renders new manager form" do
    render

    assert_select "form[action=?][method=?]", managers_path, "post" do

      assert_select "input[name=?]", "manager[first_name]"

      assert_select "input[name=?]", "manager[last_name]"

      assert_select "input[name=?]", "manager[user_id]"
    end
  end
end
