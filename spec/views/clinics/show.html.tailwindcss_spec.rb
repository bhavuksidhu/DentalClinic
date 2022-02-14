require 'rails_helper'

RSpec.describe "clinics/show", type: :view do
  before(:each) do
    @clinic = assign(:clinic, Clinic.create!(
      name: "Name",
      postal_code: "Postal Code",
      region: "Region",
      address: "MyText",
      municipalities: "Municipalities",
      building_name: "Building Name",
      floors: "Floors",
      fax_number: "Fax Number",
      phone_number: 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Postal Code/)
    expect(rendered).to match(/Region/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Municipalities/)
    expect(rendered).to match(/Building Name/)
    expect(rendered).to match(/Floors/)
    expect(rendered).to match(/Fax Number/)
    expect(rendered).to match(/2/)
  end
end
