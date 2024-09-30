require 'rails_helper'

RSpec.describe "company_areas/index", type: :view do
  before(:each) do
    assign(:company_areas, [
      CompanyArea.create!(
        name: "Name",
        description: "Description",
        active: false
      ),
      CompanyArea.create!(
        name: "Name",
        description: "Description",
        active: false
      )
    ])
  end

  it "renders a list of company_areas" do
    render
    cell_selector = 'div>p'
    assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Description".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(false.to_s), count: 2
  end
end
