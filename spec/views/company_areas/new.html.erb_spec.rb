require 'rails_helper'

RSpec.describe "company_areas/new", type: :view do
  before(:each) do
    assign(:company_area, CompanyArea.new(
      name: "MyString",
      description: "MyString",
      active: false
    ))
  end

  it "renders new company_area form" do
    render

    assert_select "form[action=?][method=?]", company_areas_path, "post" do

      assert_select "input[name=?]", "company_area[name]"

      assert_select "input[name=?]", "company_area[description]"

      assert_select "input[name=?]", "company_area[active]"
    end
  end
end
