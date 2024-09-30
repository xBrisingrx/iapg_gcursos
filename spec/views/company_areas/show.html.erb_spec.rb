require 'rails_helper'

RSpec.describe "company_areas/show", type: :view do
  before(:each) do
    assign(:company_area, CompanyArea.create!(
      name: "Name",
      description: "Description",
      active: false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Description/)
    expect(rendered).to match(/false/)
  end
end
