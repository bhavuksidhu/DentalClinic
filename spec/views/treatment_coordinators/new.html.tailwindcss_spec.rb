require 'rails_helper'

RSpec.describe "treatment_coordinators/new", type: :view do
  before(:each) do
    assign(:treatment_coordinator, TreatmentCoordinator.new(
      first_name: "MyString",
      last_name: "MyString",
      phone: 1
    ))
  end

  it "renders new treatment_coordinator form" do
    render

    assert_select "form[action=?][method=?]", treatment_coordinators_path, "post" do

      assert_select "input[name=?]", "treatment_coordinator[first_name]"

      assert_select "input[name=?]", "treatment_coordinator[last_name]"

      assert_select "input[name=?]", "treatment_coordinator[phone]"
    end
  end
end
