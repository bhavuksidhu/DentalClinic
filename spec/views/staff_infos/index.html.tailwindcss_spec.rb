require 'rails_helper'

RSpec.describe "staff_infos/index", type: :view do
  before(:each) do
    assign(:staff_infos, [
      StaffInfo.create!(
        staff_code: "Staff Code",
        first_name: "First Name",
        last_name: "Last Name",
        sex: "Sex",
        job_type: "Job Type",
        occupation: "Occupation",
        usage_classification: "Usage Classification"
      ),
      StaffInfo.create!(
        staff_code: "Staff Code",
        first_name: "First Name",
        last_name: "Last Name",
        sex: "Sex",
        job_type: "Job Type",
        occupation: "Occupation",
        usage_classification: "Usage Classification"
      )
    ])
  end

  it "renders a list of staff_infos" do
    render
    assert_select "tr>td", text: "Staff Code".to_s, count: 2
    assert_select "tr>td", text: "First Name".to_s, count: 2
    assert_select "tr>td", text: "Last Name".to_s, count: 2
    assert_select "tr>td", text: "Sex".to_s, count: 2
    assert_select "tr>td", text: "Job Type".to_s, count: 2
    assert_select "tr>td", text: "Occupation".to_s, count: 2
    assert_select "tr>td", text: "Usage Classification".to_s, count: 2
  end
end
