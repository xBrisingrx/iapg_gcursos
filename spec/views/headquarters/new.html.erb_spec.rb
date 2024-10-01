require 'rails_helper'

RSpec.describe "headquarters/new", type: :view do
  before(:each) do
    assign(:headquarter, Headquarter.new(
      name: "MyString",
      description: "MyString",
      active: false
    ))
  end

  it "renders new headquarter form" do
    render

    assert_select "form[action=?][method=?]", headquarters_path, "post" do

      assert_select "input[name=?]", "headquarter[name]"

      assert_select "input[name=?]", "headquarter[description]"

      assert_select "input[name=?]", "headquarter[active]"
    end
  end
end
