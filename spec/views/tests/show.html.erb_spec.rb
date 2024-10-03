require 'rails_helper'

RSpec.describe "tests/show", type: :view do
  before(:each) do
    assign(:test, Test.create!(
      name: "Name",
      instance: "Instance",
      fleet: "Fleet",
      modality: "modality",
      active: false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Instance/)
    expect(rendered).to match(/Fleet/)
    expect(rendered).to match(/modality/)
    expect(rendered).to match(/false/)
  end
end
