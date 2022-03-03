require 'rails_helper'

RSpec.describe "staff_infos/edit", type: :view do
  before(:each) do
    @staff_info = assign(:staff_info, StaffInfo.create!(
      staff_code: "MyString",
      first_name: "MyString",
      last_name: "MyString",
      sex: "MyString",
      job_type: "MyString",
      occupation: "MyString",
      usage_classification: "MyString"
    ))
  end

  it "renders the edit staff_info form" do
    render

    assert_select "form[action=?][method=?]", staff_info_path(@staff_info), "post" do

      assert_select "input[name=?]", "staff_info[staff_code]"

      assert_select "input[name=?]", "staff_info[first_name]"

      assert_select "input[name=?]", "staff_info[last_name]"

      assert_select "input[name=?]", "staff_info[sex]"

      assert_select "input[name=?]", "staff_info[job_type]"

      assert_select "input[name=?]", "staff_info[occupation]"

      assert_select "input[name=?]", "staff_info[usage_classification]"
    end
  end
end
