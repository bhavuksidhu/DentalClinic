require 'rails_helper'

RSpec.describe "agents/new", type: :view do
  before(:each) do
    assign(:agent, Agent.new(
      first_name: "MyString",
      last_name: "MyString",
      phone: 1
    ))
  end

  it "renders new agent form" do
    render

    assert_select "form[action=?][method=?]", agents_path, "post" do

      assert_select "input[name=?]", "agent[first_name]"

      assert_select "input[name=?]", "agent[last_name]"

      assert_select "input[name=?]", "agent[phone]"
    end
  end
end
