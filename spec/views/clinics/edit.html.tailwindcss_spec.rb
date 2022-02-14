require 'rails_helper'

RSpec.describe "clinics/edit", type: :view do
  before(:each) do
    @clinic = assign(:clinic, Clinic.create!(
      name: "MyString",
      postal_code: "MyString",
      region: "MyString",
      address: "MyText",
      municipalities: "MyString",
      building_name: "MyString",
      floors: "MyString",
      fax_number: "MyString",
      phone_number: 1
    ))
  end

  it "renders the edit clinic form" do
    render

    assert_select "form[action=?][method=?]", clinic_path(@clinic), "post" do

      assert_select "input[name=?]", "clinic[name]"

      assert_select "input[name=?]", "clinic[postal_code]"

      assert_select "input[name=?]", "clinic[region]"

      assert_select "textarea[name=?]", "clinic[address]"

      assert_select "input[name=?]", "clinic[municipalities]"

      assert_select "input[name=?]", "clinic[building_name]"

      assert_select "input[name=?]", "clinic[floors]"

      assert_select "input[name=?]", "clinic[fax_number]"

      assert_select "input[name=?]", "clinic[phone_number]"
    end
  end
end
