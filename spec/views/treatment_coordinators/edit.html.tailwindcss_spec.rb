require 'rails_helper'

RSpec.describe "treatment_coordinators/edit", type: :view do
  before(:each) do
    @treatment_coordinator = assign(:treatment_coordinator, TreatmentCoordinator.create!(
      first_name: "MyString",
      last_name: "MyString",
      phone: 1
    ))
  end

  it "renders the edit treatment_coordinator form" do
    render

    assert_select "form[action=?][method=?]", treatment_coordinator_path(@treatment_coordinator), "post" do

      assert_select "input[name=?]", "treatment_coordinator[first_name]"

      assert_select "input[name=?]", "treatment_coordinator[last_name]"

      assert_select "input[name=?]", "treatment_coordinator[phone]"
    end
  end
end
