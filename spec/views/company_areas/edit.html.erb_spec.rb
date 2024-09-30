require 'rails_helper'

RSpec.describe "company_areas/edit", type: :view do
  let(:company_area) {
    CompanyArea.create!(
      name: "MyString",
      description: "MyString",
      active: false
    )
  }

  before(:each) do
    assign(:company_area, company_area)
  end

  it "renders the edit company_area form" do
    render

    assert_select "form[action=?][method=?]", company_area_path(company_area), "post" do

      assert_select "input[name=?]", "company_area[name]"

      assert_select "input[name=?]", "company_area[description]"

      assert_select "input[name=?]", "company_area[active]"
    end
  end
end
