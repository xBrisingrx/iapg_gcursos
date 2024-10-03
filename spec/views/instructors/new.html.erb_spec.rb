require 'rails_helper'

RSpec.describe "instructors/new", type: :view do
  before(:each) do
    assign(:instructor, Instructor.new(
      name: "MyString",
      description: "MyString",
      active: false
    ))
  end

  it "renders new instructor form" do
    render

    assert_select "form[action=?][method=?]", instructors_path, "post" do

      assert_select "input[name=?]", "instructor[name]"

      assert_select "input[name=?]", "instructor[description]"

      assert_select "input[name=?]", "instructor[active]"
    end
  end
end
