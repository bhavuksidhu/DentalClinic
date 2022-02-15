require 'rails_helper'

RSpec.describe "agents/index", type: :view do
  before(:each) do
    assign(:agents, [
      Agent.create!(
        first_name: "First Name",
        last_name: "Last Name",
        phone: 2
      ),
      Agent.create!(
        first_name: "First Name",
        last_name: "Last Name",
        phone: 2
      )
    ])
  end

  it "renders a list of agents" do
    render
    assert_select "tr>td", text: "First Name".to_s, count: 2
    assert_select "tr>td", text: "Last Name".to_s, count: 2
    assert_select "tr>td", text: 2.to_s, count: 2
  end
end
