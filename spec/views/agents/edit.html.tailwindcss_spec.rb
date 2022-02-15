require 'rails_helper'

RSpec.describe "agents/edit", type: :view do
  before(:each) do
    @agent = assign(:agent, Agent.create!(
      first_name: "MyString",
      last_name: "MyString",
      phone: 1
    ))
  end

  it "renders the edit agent form" do
    render

    assert_select "form[action=?][method=?]", agent_path(@agent), "post" do

      assert_select "input[name=?]", "agent[first_name]"

      assert_select "input[name=?]", "agent[last_name]"

      assert_select "input[name=?]", "agent[phone]"
    end
  end
end
