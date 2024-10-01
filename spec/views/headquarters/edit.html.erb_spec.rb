require 'rails_helper'

RSpec.describe "headquarters/edit", type: :view do
  let(:headquarter) {
    Headquarter.create!(
      name: "MyString",
      description: "MyString",
      active: false
    )
  }

  before(:each) do
    assign(:headquarter, headquarter)
  end

  it "renders the edit headquarter form" do
    render

    assert_select "form[action=?][method=?]", headquarter_path(headquarter), "post" do

      assert_select "input[name=?]", "headquarter[name]"

      assert_select "input[name=?]", "headquarter[description]"

      assert_select "input[name=?]", "headquarter[active]"
    end
  end
end
