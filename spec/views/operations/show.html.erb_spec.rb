require 'rails_helper'

RSpec.describe "operations/show", type: :view do
  before(:each) do
    @operation = assign(:operation, Operation.create!(
      name: "Name",
      amount: "",
      user: nil,
      group: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
