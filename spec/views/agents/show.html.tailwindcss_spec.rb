require 'rails_helper'

RSpec.describe "agents/show", type: :view do
  before(:each) do
    @agent = assign(:agent, Agent.create!(
      first_name: "First Name",
      last_name: "Last Name",
      phone: 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/First Name/)
    expect(rendered).to match(/Last Name/)
    expect(rendered).to match(/2/)
  end
end
