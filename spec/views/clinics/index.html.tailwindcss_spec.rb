require 'rails_helper'

RSpec.describe "clinics/index", type: :view do
  before(:each) do
    assign(:clinics, [
      Clinic.create!(
        name: "Name",
        postal_code: "Postal Code",
        region: "Region",
        address: "MyText",
        municipalities: "Municipalities",
        building_name: "Building Name",
        floors: "Floors",
        fax_number: "Fax Number",
        phone_number: 2
      ),
      Clinic.create!(
        name: "Name",
        postal_code: "Postal Code",
        region: "Region",
        address: "MyText",
        municipalities: "Municipalities",
        building_name: "Building Name",
        floors: "Floors",
        fax_number: "Fax Number",
        phone_number: 2
      )
    ])
  end

  it "renders a list of clinics" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
    assert_select "tr>td", text: "Postal Code".to_s, count: 2
    assert_select "tr>td", text: "Region".to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: "Municipalities".to_s, count: 2
    assert_select "tr>td", text: "Building Name".to_s, count: 2
    assert_select "tr>td", text: "Floors".to_s, count: 2
    assert_select "tr>td", text: "Fax Number".to_s, count: 2
    assert_select "tr>td", text: 2.to_s, count: 2
  end
end
