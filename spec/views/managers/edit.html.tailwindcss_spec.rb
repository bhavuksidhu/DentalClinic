require 'rails_helper'

RSpec.describe "managers/edit", type: :view do
  before(:each) do
    @manager = assign(:manager, Manager.create!(
      first_name: "MyString",
      last_name: "MyString",
      user: nil
    ))
  end

  it "renders the edit manager form" do
    render

    assert_select "form[action=?][method=?]", manager_path(@manager), "post" do

      assert_select "input[name=?]", "manager[first_name]"

      assert_select "input[name=?]", "manager[last_name]"

      assert_select "input[name=?]", "manager[user_id]"
    end
  end
end
