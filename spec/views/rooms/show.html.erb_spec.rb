require 'rails_helper'

RSpec.describe "rooms/show", type: :view do
  before(:each) do
    assign(:room, Room.create!(
      name: "Name",
      description: "Description",
      headquarter: nil,
      active: false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Description/)
    expect(rendered).to match(//)
    expect(rendered).to match(/false/)
  end
end
