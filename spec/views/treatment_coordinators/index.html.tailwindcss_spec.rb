require 'rails_helper'

RSpec.describe "treatment_coordinators/index", type: :view do
  before(:each) do
    assign(:treatment_coordinators, [
      TreatmentCoordinator.create!(
        first_name: "First Name",
        last_name: "Last Name",
        phone: 2
      ),
      TreatmentCoordinator.create!(
        first_name: "First Name",
        last_name: "Last Name",
        phone: 2
      )
    ])
  end

  it "renders a list of treatment_coordinators" do
    render
    assert_select "tr>td", text: "First Name".to_s, count: 2
    assert_select "tr>td", text: "Last Name".to_s, count: 2
    assert_select "tr>td", text: 2.to_s, count: 2
  end
end
