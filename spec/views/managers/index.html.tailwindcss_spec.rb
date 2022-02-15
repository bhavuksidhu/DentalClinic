require 'rails_helper'

RSpec.describe "managers/index", type: :view do
  before(:each) do
    assign(:managers, [
      Manager.create!(
        first_name: "First Name",
        last_name: "Last Name",
        user: nil
      ),
      Manager.create!(
        first_name: "First Name",
        last_name: "Last Name",
        user: nil
      )
    ])
  end

  it "renders a list of managers" do
    render
    assert_select "tr>td", text: "First Name".to_s, count: 2
    assert_select "tr>td", text: "Last Name".to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
  end
end
