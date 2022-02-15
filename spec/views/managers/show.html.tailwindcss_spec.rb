require 'rails_helper'

RSpec.describe "managers/show", type: :view do
  before(:each) do
    @manager = assign(:manager, Manager.create!(
      first_name: "First Name",
      last_name: "Last Name",
      user: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/First Name/)
    expect(rendered).to match(/Last Name/)
    expect(rendered).to match(//)
  end
end
