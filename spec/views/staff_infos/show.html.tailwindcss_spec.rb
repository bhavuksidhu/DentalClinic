require 'rails_helper'

RSpec.describe "staff_infos/show", type: :view do
  before(:each) do
    @staff_info = assign(:staff_info, StaffInfo.create!(
      staff_code: "Staff Code",
      first_name: "First Name",
      last_name: "Last Name",
      sex: "Sex",
      job_type: "Job Type",
      occupation: "Occupation",
      usage_classification: "Usage Classification"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Staff Code/)
    expect(rendered).to match(/First Name/)
    expect(rendered).to match(/Last Name/)
    expect(rendered).to match(/Sex/)
    expect(rendered).to match(/Job Type/)
    expect(rendered).to match(/Occupation/)
    expect(rendered).to match(/Usage Classification/)
  end
end
